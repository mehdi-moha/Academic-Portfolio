# ============================================================
# 1) Import libraries and check environment
# ============================================================

import tensorflow as tf
from tensorflow.keras import layers, models
import numpy as np
import matplotlib.pyplot as plt
from scipy import io
import os

print("TensorFlow:", tf.__version__)
print("GPU:", tf.config.list_physical_devices('GPU'))

# ============================================================
# 2) Set random seeds
# ============================================================

RANDOM_SEED = 7
np.random.seed(RANDOM_SEED)
tf.random.set_seed(RANDOM_SEED)
tf.keras.utils.set_random_seed(RANDOM_SEED)

# ============================================================
# 3) Configuration
# ============================================================

CONFIG = {
    'batch_size': 32,
    'noise_dim': 100,
    'num_epochs': 15,
    'learning_rate_gen': 0.0002,
    'learning_rate_disc': 0.0002,
    'beta_1': 0.5,
    'sample_interval': 5,
    'disc_steps': 4
}

TARGET = 32
CONFIG['image_height'] = TARGET
CONFIG['image_width'] = TARGET

# ============================================================
# 4) Load HODA dataset
# ============================================================

def get_dataset(data_path='/content/Data_hoda_full.mat'):
    dataset = io.loadmat(data_path)
    x_data = np.squeeze(dataset['Data'])

    total_samples = x_data.shape[0]
    print(f"Total samples in dataset: {total_samples}")

    max_r = 0
    max_c = 0

    for img in x_data:
        r, c = img.shape

        if r > max_r:
            max_r = r

        if c > max_c:
            max_c = c

    print(f"Max image height: {max_r}")
    print(f"Max image width: {max_c}")

    max_dim = max(max_r, max_c)
    H, W = max_dim, max_dim

    return x_data, H, W, total_samples

# ============================================================
# 5) Image preprocessing generator
# ============================================================

def image_generator(x_data, H, W):
    for img in x_data:
        r, c = img.shape

        canvas = np.zeros((H, W), dtype=np.float32)

        r_start = (H - r) // 2
        c_start = (W - c) // 2
        canvas[r_start:r_start + r, c_start:c_start + c] = img.astype(np.float32)

        canvas = canvas / 255.0

        canvas = tf.image.resize(
            canvas[..., np.newaxis],
            [TARGET, TARGET],
            method='area'
        ).numpy()

        canvas = np.clip(canvas, 0.0, 1.0)

        canvas = (canvas * 2.0) - 1.0

        yield canvas.astype(np.float32)

# ============================================================
# 6) Build TensorFlow dataset
# ============================================================

x_data, H, W, total_samples = get_dataset()

train_dataset = tf.data.Dataset.from_generator(
    lambda: image_generator(x_data, H, W),
    output_signature=tf.TensorSpec(shape=(TARGET, TARGET, 1), dtype=tf.float32)
)

train_dataset = (
    train_dataset
    .shuffle(
        buffer_size=5000,
        seed=RANDOM_SEED,
        reshuffle_each_iteration=True
    )
    .batch(CONFIG['batch_size'], drop_remainder=True)
    .prefetch(tf.data.AUTOTUNE)
)

# ============================================================
# 7) Generator model
# ============================================================

def build_generator(noise_dim, img_h, img_w):
    init_h = img_h // 4
    init_w = img_w // 4

    model = models.Sequential(name='Generator')

    model.add(layers.Input(shape=(noise_dim,)))

    model.add(layers.Dense(init_h * init_w * 256, use_bias=False))
    model.add(layers.Reshape((init_h, init_w, 256)))
    model.add(layers.BatchNormalization(momentum=0.8))
    model.add(layers.ReLU())

    model.add(layers.Conv2DTranspose(128, 5, strides=2, padding='same', use_bias=False))
    model.add(layers.BatchNormalization(momentum=0.8))
    model.add(layers.ReLU())

    model.add(layers.Conv2DTranspose(64, 5, strides=2, padding='same', use_bias=False))
    model.add(layers.BatchNormalization(momentum=0.8))
    model.add(layers.ReLU())

    model.add(layers.Conv2D(1, 5, padding='same', activation='tanh'))

    return model

# ============================================================
# 8) Discriminator model
# ============================================================

def build_discriminator(img_h, img_w):
    model = models.Sequential(name='Discriminator')

    model.add(layers.Input(shape=(img_h, img_w, 1)))

    model.add(layers.Conv2D(64, 5, strides=2, padding='same'))
    model.add(layers.LeakyReLU(0.2))
    model.add(layers.Dropout(0.5))

    model.add(layers.Conv2D(128, 5, strides=2, padding='same'))
    model.add(layers.LeakyReLU(0.2))
    model.add(layers.Dropout(0.5))

    model.add(layers.Flatten())
    model.add(layers.Dense(1, activation='sigmoid'))

    return model

# ============================================================
# 9) Create models and optimizers
# ============================================================

generator = build_generator(
    CONFIG['noise_dim'],
    CONFIG['image_height'],
    CONFIG['image_width']
)

discriminator = build_discriminator(
    CONFIG['image_height'],
    CONFIG['image_width']
)

generator.summary()
discriminator.summary()

bce_loss = tf.keras.losses.BinaryCrossentropy()

gen_optimizer = tf.keras.optimizers.Adam(
    learning_rate=CONFIG['learning_rate_gen'],
    beta_1=CONFIG['beta_1']
)

disc_optimizer = tf.keras.optimizers.Adam(
    learning_rate=CONFIG['learning_rate_disc'],
    beta_1=CONFIG['beta_1']
)

fixed_noise = tf.random.normal(
    [16, CONFIG['noise_dim']],
    dtype=tf.float32
)

# ============================================================
# 10) Display generated samples
# ============================================================

def generate_and_display(gen, epoch, noise, n=16):
    imgs = gen(noise, training=False)

    imgs = (imgs + 1.0) / 2.0

    fig = plt.figure(figsize=(4, 4))

    for i in range(n):
        plt.subplot(4, 4, i + 1)
        plt.imshow(
            imgs[i, :, :, 0],
            cmap='gray',
            interpolation='nearest',
            vmin=0,
            vmax=1
        )
        plt.axis('off')

    plt.suptitle(f'Epoch {epoch}')
    plt.tight_layout()
    plt.show()
    plt.close(fig)

# ============================================================
# 11) One training step
# ============================================================

@tf.function
def train_step(real_imgs):
    batch_size = tf.shape(real_imgs)[0]

    d_loss_total = tf.constant(0.0, dtype=tf.float32)

    for _ in range(CONFIG['disc_steps']):
        noise = tf.random.normal(
            [batch_size, CONFIG['noise_dim']],
            dtype=tf.float32
        )

        fake_imgs = generator(noise, training=False)

        real_labels = tf.ones((batch_size, 1), dtype=tf.float32) * 0.9
        fake_labels = tf.zeros((batch_size, 1), dtype=tf.float32)

        combined_imgs = tf.concat([fake_imgs, real_imgs], axis=0)
        labels = tf.concat([fake_labels, real_labels], axis=0)

        indices = tf.random.shuffle(tf.range(tf.shape(combined_imgs)[0]))
        combined_imgs = tf.gather(combined_imgs, indices)
        labels = tf.gather(labels, indices)

        with tf.GradientTape() as disc_tape:
            predictions = discriminator(combined_imgs, training=True)
            d_loss = bce_loss(labels, predictions)

        d_grads = disc_tape.gradient(
            d_loss,
            discriminator.trainable_variables
        )

        disc_optimizer.apply_gradients(
            zip(d_grads, discriminator.trainable_variables)
        )

        d_loss_total += d_loss

    d_loss_avg = d_loss_total / tf.cast(CONFIG['disc_steps'], tf.float32)

    noise = tf.random.normal(
        [batch_size, CONFIG['noise_dim']],
        dtype=tf.float32
    )

    target_labels = tf.ones((batch_size, 1), dtype=tf.float32)

    with tf.GradientTape() as gen_tape:
        generated_imgs = generator(noise, training=True)
        predictions = discriminator(generated_imgs, training=False)
        g_loss = bce_loss(target_labels, predictions)

    g_grads = gen_tape.gradient(
        g_loss,
        generator.trainable_variables
    )

    gen_optimizer.apply_gradients(
        zip(g_grads, generator.trainable_variables)
    )

    return d_loss_avg, g_loss

# ============================================================
# 12) Full training loop
# ============================================================

def train_gan(dataset, config):
    history = {
        'd_loss': [],
        'g_loss': []
    }

    for epoch in range(config['num_epochs']):
        print(f"\nEpoch {epoch + 1}/{config['num_epochs']}")

        epoch_d_loss = []
        epoch_g_loss = []
        batch_num = 0

        for real_imgs in dataset:
            batch_num += 1

            d_loss, g_loss = train_step(real_imgs)

            epoch_d_loss.append(float(d_loss.numpy()))
            epoch_g_loss.append(float(g_loss.numpy()))

            if batch_num % 50 == 0:
                print(
                    f"  Batch {batch_num}: "
                    f"D={np.mean(epoch_d_loss[-50:]):.4f}, "
                    f"G={np.mean(epoch_g_loss[-50:]):.4f}"
                )

        mean_d_loss = np.mean(epoch_d_loss)
        mean_g_loss = np.mean(epoch_g_loss)

        history['d_loss'].append(mean_d_loss)
        history['g_loss'].append(mean_g_loss)

        print(
            f"Epoch {epoch + 1} finished: "
            f"D={mean_d_loss:.4f}, "
            f"G={mean_g_loss:.4f}"
        )

        if (epoch + 1) % config['sample_interval'] == 0:
            generate_and_display(
                generator,
                epoch + 1,
                fixed_noise
            )

    return history

# ============================================================
# 13) Train the DCGAN
# ============================================================

history = train_gan(train_dataset, CONFIG)

# ============================================================
# 14) Plot loss curves
# ============================================================

epochs_range = range(1, len(history['d_loss']) + 1)

plt.figure(figsize=(10, 4))

plt.subplot(1, 2, 1)
plt.plot(epochs_range, history['d_loss'], 'b-', linewidth=2)
plt.title('Discriminator Loss')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.grid(alpha=0.3)

plt.subplot(1, 2, 2)
plt.plot(epochs_range, history['g_loss'], 'r-', linewidth=2)
plt.title('Generator Loss')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.grid(alpha=0.3)

plt.tight_layout()
plt.show()
plt.close('all')

# ============================================================
# 15) Save and download the Generator
# ============================================================

output_dir = '/content/saved_models'
os.makedirs(output_dir, exist_ok=True)

generator_path = os.path.join(output_dir, 'generator.keras')
generator.save(generator_path)

print(f"Generator model saved to: {generator_path}")

try:
    from google.colab import files
    files.download(generator_path)
except Exception as e:
    print("Download is available when running inside Google Colab.")
    print(e)