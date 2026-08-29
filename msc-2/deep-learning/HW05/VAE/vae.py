# ============================================================
# 1) Import libraries
# ============================================================

import tensorflow as tf
from tensorflow.keras import layers, Model
import matplotlib.pyplot as plt
import numpy as np
from scipy import io
import os

# ============================================================
# 2) Set random seed
# ============================================================

RANDOM_SEED = 42
np.random.seed(RANDOM_SEED)
tf.random.set_seed(RANDOM_SEED)
tf.keras.utils.set_random_seed(RANDOM_SEED)

# ============================================================
# 3) VAE configuration
# ============================================================

VAE_CONFIG = {
    'latent_dim': 16,
    'batch_size': 128,
    'epochs': 50,
    'learning_rate': 0.001,
    'train_ratio': 0.8,
    'target_size': 28
}

# ============================================================
# 4) Load and preprocess HODA dataset
# ============================================================

def get_dataset(data_path='/content/Data_hoda_full.mat'):
    data = io.loadmat(data_path)
    images = np.squeeze(data['Data'])
    total_samples = images.shape[0]

    print(f"Total samples in dataset: {total_samples}")

    max_r = 0
    max_c = 0

    for img in images:
        r, c = img.shape

        if r > max_r:
            max_r = r

        if c > max_c:
            max_c = c

    print(f"Max image height: {max_r}")
    print(f"Max image width: {max_c}")

    max_dim = max(max_r, max_c)
    canvas_h, canvas_w = max_dim, max_dim

    processed = np.zeros((total_samples, canvas_h, canvas_w), dtype=np.float32)

    for i, img in enumerate(images):
        r, c = img.shape

        canvas = np.zeros((canvas_h, canvas_w), dtype=np.float32)

        r_start = (canvas_h - r) // 2
        c_start = (canvas_w - c) // 2

        canvas[r_start:r_start + r, c_start:c_start + c] = img.astype(np.float32)

        processed[i] = canvas / 255.0

    target_size = VAE_CONFIG['target_size']

    processed = processed[..., np.newaxis]

    processed = tf.image.resize(
        processed,
        [target_size, target_size],
        method='area'
    ).numpy()

    processed = np.clip(processed, 0.0, 1.0)

    processed = processed[..., 0].astype(np.float32)

    VAE_CONFIG['image_height'] = target_size
    VAE_CONFIG['image_width'] = target_size

    train_count = int(total_samples * VAE_CONFIG['train_ratio'])

    train_data = processed[:train_count]
    test_data = processed[train_count:]

    rng = np.random.default_rng(RANDOM_SEED)
    train_indices = rng.permutation(train_data.shape[0])
    train_data = train_data[train_indices]

    print(f"Train samples: {train_data.shape[0]}")
    print(f"Test samples: {test_data.shape[0]}")
    print(f"Image shape: ({target_size}, {target_size})")

    return train_data, test_data

train_data, test_data = get_dataset()

# ============================================================
# 5) Sampling layer
# ============================================================

@tf.keras.utils.register_keras_serializable(package="Custom")
class Sampling(layers.Layer):

    def call(self, inputs):
        z_mean, z_log_var = inputs

        z_log_var_clipped = tf.clip_by_value(z_log_var, -10.0, 2.0)

        batch_size = tf.shape(z_mean)[0]
        latent_dim = tf.shape(z_mean)[1]

        epsilon = tf.random.normal(shape=(batch_size, latent_dim))

        return z_mean + tf.exp(0.5 * z_log_var_clipped) * epsilon

    def get_config(self):
        config = super().get_config()
        return config

# ============================================================
# 6) Build Encoder
# ============================================================

def build_encoder(input_shape, latent_dim):
    inputs = layers.Input(shape=input_shape)

    x = layers.Flatten()(inputs)

    x = layers.Dense(512, activation='relu')(x)
    x = layers.Dense(256, activation='relu')(x)
    x = layers.Dense(128, activation='relu')(x)

    z_mean = layers.Dense(latent_dim, name='z_mean')(x)
    z_log_var = layers.Dense(latent_dim, name='z_log_var')(x)

    z = Sampling(name='z')([z_mean, z_log_var])

    return Model(inputs, [z_mean, z_log_var, z], name='Encoder')

# ============================================================
# 7) Build Decoder
# ============================================================

def build_decoder(latent_dim, output_shape):
    inputs = layers.Input(shape=(latent_dim,))

    x = layers.Dense(128, activation='relu')(inputs)
    x = layers.Dense(256, activation='relu')(x)
    x = layers.Dense(512, activation='relu')(x)

    x = layers.Dense(
        output_shape[0] * output_shape[1],
        activation='sigmoid'
    )(x)

    outputs = layers.Reshape(output_shape)(x)

    return Model(inputs, outputs, name='Decoder')

# ============================================================
# 8) Create Encoder and Decoder
# ============================================================

image_shape = (
    VAE_CONFIG['image_height'],
    VAE_CONFIG['image_width']
)

encoder = build_encoder(
    image_shape,
    VAE_CONFIG['latent_dim']
)

decoder = build_decoder(
    VAE_CONFIG['latent_dim'],
    image_shape
)

encoder.summary()
decoder.summary()

# ============================================================
# 9) Define custom VAE model
# ============================================================

class VAE(Model):

    def __init__(self, encoder, decoder, **kwargs):
        super().__init__(**kwargs)

        self.encoder = encoder
        self.decoder = decoder

        self.image_pixels = (
            VAE_CONFIG['image_height'] * VAE_CONFIG['image_width']
        )

        self.total_loss_tracker = tf.keras.metrics.Mean(name='loss')
        self.recon_loss_tracker = tf.keras.metrics.Mean(name='recon_loss')
        self.kl_loss_tracker = tf.keras.metrics.Mean(name='kl_loss')
        self.pixel_acc_tracker = tf.keras.metrics.Mean(name='pixel_accuracy')

    @property
    def metrics(self):
        return [
            self.total_loss_tracker,
            self.recon_loss_tracker,
            self.kl_loss_tracker,
            self.pixel_acc_tracker
        ]

    def call(self, inputs):
        z_mean, z_log_var, z = self.encoder(inputs)
        reconstruction = self.decoder(z)
        return reconstruction

    def compute_losses(self, data):
        z_mean, z_log_var, z = self.encoder(data)
        reconstruction = self.decoder(z)

        data_flat = tf.reshape(data, [-1, self.image_pixels])
        recon_flat = tf.reshape(reconstruction, [-1, self.image_pixels])

        recon_loss = tf.reduce_mean(
            tf.reduce_sum(
                -(
                    data_flat * tf.math.log(recon_flat + 1e-7) +
                    (1.0 - data_flat) * tf.math.log(1.0 - recon_flat + 1e-7)
                ),
                axis=-1
            )
        )

        z_log_var_clipped = tf.clip_by_value(z_log_var, -10.0, 2.0)

        kl_loss = tf.reduce_mean(
            -0.5 * tf.reduce_sum(
                1.0 +
                z_log_var_clipped -
                tf.square(z_mean) -
                tf.exp(z_log_var_clipped),
                axis=-1
            )
        )

        total_loss = recon_loss + kl_loss

        true_bin = tf.cast(data_flat >= 0.5, tf.float32)
        pred_bin = tf.cast(recon_flat >= 0.5, tf.float32)

        pixel_acc = tf.reduce_mean(
            tf.cast(tf.equal(true_bin, pred_bin), tf.float32)
        )

        return total_loss, recon_loss, kl_loss, pixel_acc

    def train_step(self, data):
        if isinstance(data, tuple):
            data = data[0]

        with tf.GradientTape() as tape:
            total_loss, recon_loss, kl_loss, pixel_acc = self.compute_losses(data)

        grads = tape.gradient(total_loss, self.trainable_weights)

        self.optimizer.apply_gradients(
            zip(grads, self.trainable_weights)
        )

        self.total_loss_tracker.update_state(total_loss)
        self.recon_loss_tracker.update_state(recon_loss)
        self.kl_loss_tracker.update_state(kl_loss)
        self.pixel_acc_tracker.update_state(pixel_acc)

        return {
            m.name: m.result()
            for m in self.metrics
        }

    def test_step(self, data):
        if isinstance(data, tuple):
            data = data[0]

        total_loss, recon_loss, kl_loss, pixel_acc = self.compute_losses(data)

        self.total_loss_tracker.update_state(total_loss)
        self.recon_loss_tracker.update_state(recon_loss)
        self.kl_loss_tracker.update_state(kl_loss)
        self.pixel_acc_tracker.update_state(pixel_acc)

        return {
            m.name: m.result()
            for m in self.metrics
        }

# ============================================================
# 10) Compile VAE
# ============================================================

vae = VAE(encoder, decoder)

vae.compile(
    optimizer=tf.keras.optimizers.Adam(
        VAE_CONFIG['learning_rate']
    )
)

# ============================================================
# 11) Train VAE
# ============================================================

early_stop = tf.keras.callbacks.EarlyStopping(
    monitor='val_loss',
    patience=5,
    restore_best_weights=True
)

history = vae.fit(
    train_data,
    batch_size=VAE_CONFIG['batch_size'],
    epochs=VAE_CONFIG['epochs'],
    validation_data=(test_data, test_data),
    callbacks=[early_stop],
    shuffle=True,
    verbose=1
)

# ============================================================
# 12) Plot training curves
# ============================================================

_, axes = plt.subplots(1, 2, figsize=(10, 4))

axes[0].plot(history.history['loss'], label='Train')

if 'val_loss' in history.history:
    axes[0].plot(history.history['val_loss'], label='Validation')

axes[0].set_title('Loss')
axes[0].set_xlabel('Epoch')
axes[0].set_ylabel('Loss')
axes[0].legend()
axes[0].grid(alpha=0.3)

if 'pixel_accuracy' in history.history:
    axes[1].plot(history.history['pixel_accuracy'], label='Train')

if 'val_pixel_accuracy' in history.history:
    axes[1].plot(history.history['val_pixel_accuracy'], label='Validation')

axes[1].set_title('Pixel Accuracy')
axes[1].set_xlabel('Epoch')
axes[1].set_ylabel('Accuracy')
axes[1].legend()
axes[1].grid(alpha=0.3)

plt.tight_layout()
plt.show()

# ============================================================
# 13) Reconstruct test images
# ============================================================

reconstructed = vae.predict(
    test_data[:8],
    verbose=0
)

_, axes = plt.subplots(2, 8, figsize=(12, 3))

for i in range(8):
    axes[0, i].imshow(
        test_data[i],
        cmap='gray',
        interpolation='nearest',
        vmin=0,
        vmax=1
    )
    axes[0, i].axis('off')

    axes[1, i].imshow(
        reconstructed[i],
        cmap='gray',
        interpolation='nearest',
        vmin=0,
        vmax=1
    )
    axes[1, i].axis('off')

axes[0, 0].set_ylabel('Original')
axes[1, 0].set_ylabel('Recon')

plt.tight_layout()
plt.show()

# ============================================================
# 14) Generate new samples
# ============================================================

z_sample = tf.random.normal(
    (16, VAE_CONFIG['latent_dim'])
)

generated = decoder.predict(
    z_sample,
    verbose=0
)

_, axes = plt.subplots(4, 4, figsize=(6, 6))

for i in range(16):
    axes[i // 4, i % 4].imshow(
        generated[i],
        cmap='gray',
        interpolation='nearest',
        vmin=0,
        vmax=1
    )
    axes[i // 4, i % 4].axis('off')

plt.suptitle('Generated Samples')
plt.tight_layout()
plt.show()

# ============================================================
# 15) Save encoder and decoder
# ============================================================

save_dir = '/content/vae_models'
os.makedirs(save_dir, exist_ok=True)

encoder.save(
    os.path.join(save_dir, 'encoder.keras')
)

decoder.save(
    os.path.join(save_dir, 'decoder.keras')
)

print("Encoder saved to:", os.path.join(save_dir, 'encoder.keras'))
print("Decoder saved to:", os.path.join(save_dir, 'decoder.keras'))

# ============================================================
# 16) Test loading saved models
# ============================================================

loaded_encoder = tf.keras.models.load_model(
    os.path.join(save_dir, 'encoder.keras')
)

loaded_decoder = tf.keras.models.load_model(
    os.path.join(save_dir, 'decoder.keras')
)

print("Encoder and decoder loaded successfully.")

# ============================================================
# 17) Download saved models from Colab
# ============================================================

from google.colab import files

files.download(
    os.path.join(save_dir, 'encoder.keras')
)

files.download(
    os.path.join(save_dir, 'decoder.keras')
)
