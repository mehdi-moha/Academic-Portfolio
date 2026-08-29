# ===============================================
# 1) Install And Import Libraries
# ===============================================

!pip install comet_ml --quiet

import shutil
import gc
import comet_ml
comet_ml.login()

import numpy as np
import matplotlib.pyplot as plt
from scipy import io
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.constraints import MaxNorm
from tensorflow.keras.utils import to_categorical
from tensorflow.keras.layers import Dense, Dropout
from tensorflow.keras import regularizers

# ===============================================
# 2) Set Random Seed
# ===============================================

RANDOM_SEED = 42
np.random.seed(RANDOM_SEED)
tf.random.set_seed(RANDOM_SEED)
tf.keras.utils.set_random_seed(RANDOM_SEED)

# ===============================================
# 3) Model Architecture
# ===============================================

def build_model_graph(experiment):

    reg_name = experiment.get_parameter("k_r")
    reg = regularizers.l1(1e-4) if reg_name == "l1" else regularizers.l2(1e-4)

    model = Sequential()

    model.add(tf.keras.Input(shape=(784,)))

    model.add(Dense(experiment.get_parameter("first_layer_units"),
                    activation='relu',
                    kernel_constraint=MaxNorm(3),
                    kernel_regularizer=reg))

    model.add(Dropout(0.2))

    model.add(Dense(200,
                    activation='relu',
                    kernel_constraint=MaxNorm(3),
                    kernel_regularizer=reg))

    model.add(Dropout(0.2))

    model.add(Dense(10, activation='softmax'))

    model.compile(loss='categorical_crossentropy',
                  optimizer='adam',
                  metrics=['accuracy'])

    return model

# ===============================================
# 4) Training And Evaluation Functions
# ===============================================

def train(experiment, model, X_tr, Y_tr, epochs):

    checkpoint_cb = tf.keras.callbacks.ModelCheckpoint(
        filepath="/content/best_epoch_model.keras",
        monitor='val_accuracy',
        save_best_only=True,
        mode='max',
        verbose=0
    )

    history = model.fit(
        X_tr, Y_tr,
        batch_size=experiment.get_parameter("batch_size"),
        epochs=epochs,
        validation_split=0.2,
        shuffle=True,
        callbacks=[checkpoint_cb]
    )

    experiment.log_metric("loss", history.history['loss'][-1])
    experiment.log_metric("accuracy", history.history['accuracy'][-1])
    experiment.log_metric("val_loss", history.history['val_loss'][-1])
    experiment.log_metric("val_accuracy", max(history.history['val_accuracy']))

    return history

def evaluate(model, X_te, Y_te):

    score = model.evaluate(X_te, Y_te, verbose=0)

    print("Test Loss:", score[0])
    print("Test Accuracy:", score[1])

    return score

# ===============================================
# 5) Dataset Loading And Preprocessing
# ===============================================

def get_dataset(data_path='/content/Data_hoda_full.mat'):

    data = io.loadmat(data_path)

    x_all = np.squeeze(data['Data'])
    y_all = np.squeeze(data['labels'])

    x_tr = x_all[:10000]
    y_tr = y_all[:10000]
    x_te = x_all[10000:12000]
    y_te = y_all[10000:12000]

    target_size = 28

    def square_and_resize(images, target_size):

        n = images.shape[0]

        max_r, max_c = 0, 0

        for img in images:
            r, c = img.shape

            if r > max_r:
                max_r = r

            if c > max_c:
                max_c = c

        max_dim = max(max_r, max_c)
        H, W = max_dim, max_dim

        processed = np.zeros((n, H, W), dtype=np.float32)

        for i, img in enumerate(images):
            r, c = img.shape

            canvas = np.zeros((H, W), dtype=np.float32)

            r_start = (H - r) // 2
            c_start = (W - c) // 2

            canvas[r_start:r_start + r, c_start:c_start + c] = img.astype(np.float32)
            processed[i] = canvas / 255.0

        processed = processed[..., np.newaxis]

        processed = tf.image.resize(
            processed,
            [target_size, target_size],
            method='area'
        ).numpy()

        processed = np.clip(processed, 0.0, 1.0)
        processed = processed[..., 0].astype(np.float32)

        return processed

    X_tr_img = square_and_resize(x_tr, target_size)
    X_te_img = square_and_resize(x_te, target_size)

    rng = np.random.default_rng(RANDOM_SEED)
    train_indices = rng.permutation(X_tr_img.shape[0])

    X_tr_img = X_tr_img[train_indices]
    y_tr = y_tr[train_indices]

    X_tr = X_tr_img.reshape(X_tr_img.shape[0], -1)
    X_te = X_te_img.reshape(X_te_img.shape[0], -1)

    Y_tr = to_categorical(y_tr, 10)
    Y_te = to_categorical(y_te, 10)

    return X_tr, Y_tr, X_te, Y_te, X_tr_img

# ===============================================
# 6) Data Visualization
# ===============================================

X_tr, Y_tr, X_te, Y_te, X_tr_img = get_dataset()

print("X_tr_img shape:", X_tr_img.shape)
print("X_te shape:", X_te.shape)

plt.figure(figsize=(3, 3))

for i in range(6):
    plt.subplot(2, 3, i + 1)
    plt.xticks([])
    plt.yticks([])
    plt.grid(False)
    plt.imshow(X_tr_img[i], cmap='binary', aspect='equal')

plt.show()

# ===============================================
# 7) Comet Ml Optimization Setup
# ===============================================

config = {
    "algorithm": "bayes",
    "name": "Optimize My Network",
    "spec": {
        "objective": "maximize",
        "metric": "val_accuracy",
        "maxCombo": 5
    },
    "parameters": {
        "first_layer_units": {"type": "integer", "min": 400, "max": 650},
        "batch_size": {"type": "discrete", "values": [64, 128, 256]},
        "k_r": {"type": "categorical", "values": ["l1", "l2"]},
    },
    "trials": 1,
}

opt = comet_ml.Optimizer(config)

best_val_acc = 0
best_params = None
best_model_path = "/content/best_hoda_model.keras"
EPOCHS = 20

# ===============================================
# 8) Run Comet Ml Experiments
# ===============================================

for experiment in opt.get_experiments():

    tf.keras.backend.clear_session()
    gc.collect()

    experiment.log_parameter("epochs", EPOCHS)

    model = build_model_graph(experiment)
    history = train(experiment, model, X_tr, Y_tr, EPOCHS)

    trial_params = {
        "first_layer_units": experiment.get_parameter("first_layer_units"),
        "batch_size": experiment.get_parameter("batch_size"),
        "k_r": experiment.get_parameter("k_r"),
        "epochs": EPOCHS
    }

    val_acc = max(history.history['val_accuracy'])

    if val_acc > best_val_acc:
        best_val_acc = val_acc
        best_params = trial_params
        shutil.copy("/content/best_epoch_model.keras", best_model_path)

    plt.figure()
    plt.plot(history.history['loss'], label='Train Loss', color='red')
    plt.plot(history.history['val_loss'], label='Validation Loss', color='blue')
    plt.legend()
    plt.show()

    plt.figure()
    plt.plot(history.history['accuracy'], label='Train Accuracy', color='red')
    plt.plot(history.history['val_accuracy'], label='Validation Accuracy', color='blue')
    plt.legend()
    plt.show()

    experiment.end()

# ===============================================
# 9) Final Evaluation And Prediction
# ===============================================

print("Best Validation Accuracy:", best_val_acc)
print("Best Parameters:", best_params)

best_model = tf.keras.models.load_model(best_model_path)

print("\nFinal test evaluation with best model:")
score = evaluate(best_model, X_te, Y_te)

print("\nBest Test Accuracy:", score[1])

preds = best_model.predict(X_te[:5])

for i in range(5):
    plt.imshow(X_te[i].reshape(28, 28), cmap='binary')
    plt.title(f"True: {np.argmax(Y_te[i])}, Pred: {np.argmax(preds[i])}")
    plt.show()
