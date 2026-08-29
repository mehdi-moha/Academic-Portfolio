# ===============================================
# 1) Dataset Setup And Download
# ===============================================

import os
import zipfile

DATA_DIR = "/content/traffic-signs-data/"

if not os.path.exists(DATA_DIR):
    os.makedirs(DATA_DIR)

if not os.path.exists(os.path.join(DATA_DIR, "train.p")):
    print("Downloading dataset...")
    !wget -q https://d17h27t6h515a5.cloudfront.net/topher/2017/February/5898cd6f_traffic-signs-data/traffic-signs-data.zip -P {DATA_DIR}

    print("Extracting...")
    with zipfile.ZipFile(os.path.join(DATA_DIR, "traffic-signs-data.zip"), "r") as zf:
        zf.extractall(DATA_DIR)
    print("Extraction complete.")
else:
    print("Dataset already exists.")

if not os.path.exists(os.path.join(DATA_DIR, "signnames.csv")):
    print("Downloading labels...")
    !wget -q https://raw.githubusercontent.com/AvivSham/German-Traffic-Signs-Classification/master/signnames.csv -P {DATA_DIR}
    print("Labels downloaded.")
else:
    print("Labels already exist.")

print("\nSetup complete. Files:")
!ls {DATA_DIR}

# ===============================================
# 2) Import Libraries And Configuration
# ===============================================

import pickle
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import cv2
import random
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
from sklearn.utils import shuffle
from sklearn.metrics import confusion_matrix, classification_report
import seaborn as sns
import warnings

warnings.filterwarnings("ignore")

SEED = 50
random.seed(SEED)
np.random.seed(SEED)
tf.random.set_seed(SEED)

print("TensorFlow version:", tf.__version__)

DATA_PATH = "/content/traffic-signs-data/"
MODEL_PATH = DATA_PATH + "saved_model.keras"
NUM_CLASSES = 43
BATCH_SIZE = 64
EPOCHS = 30

# ===============================================
# 3) Load Dataset And Class Labels
# ===============================================

print("Loading data...")

with open(DATA_PATH + "train.p", "rb") as f:
    train = pickle.load(f)

with open(DATA_PATH + "valid.p", "rb") as f:
    valid = pickle.load(f)

with open(DATA_PATH + "test.p", "rb") as f:
    test = pickle.load(f)

sign_names = pd.read_csv(DATA_PATH + "signnames.csv")
label_map = dict(zip(sign_names["ClassId"], sign_names["SignName"]))

X_train, y_train = train["features"], train["labels"]
X_valid, y_valid = valid["features"], valid["labels"]
X_test, y_test = test["features"], test["labels"]

print(f"Train: {X_train.shape}")
print(f"Valid: {X_valid.shape}")
print(f"Test:  {X_test.shape}")

# ===============================================
# 4) Initial Data Visualization
# ===============================================

_, axes = plt.subplots(2, 6, figsize=(15, 5))

for i in range(12):
    idx = random.randint(0, len(X_train) - 1)
    ax = axes[i // 6][i % 6]
    ax.imshow(X_train[idx])
    ax.set_title(label_map[y_train[idx]][:20], fontsize=8)
    ax.axis("off")

plt.suptitle("Random Training Samples")
plt.tight_layout()
plt.show()

plt.figure(figsize=(14, 4))
plt.hist(y_train, bins=NUM_CLASSES, edgecolor="black", alpha=0.75, color="steelblue")
plt.xlabel("Class ID")
plt.ylabel("Count")
plt.title("Class Distribution in Training Set")
plt.grid(axis="y", alpha=0.3)
plt.show()

# ===============================================
# 5) Image Preprocessing
# ===============================================

def preprocess_images(images):
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(4, 4))
    output = []

    for img in images:
        yuv = cv2.cvtColor(img, cv2.COLOR_RGB2YUV)
        yuv[:, :, 0] = clahe.apply(yuv[:, :, 0])
        img_enhanced = cv2.cvtColor(yuv, cv2.COLOR_YUV2RGB)
        output.append(img_enhanced)

    return np.array(output, dtype=np.float32) / 255.0

X_train, y_train = shuffle(X_train, y_train, random_state=SEED)

print("Preprocessing images...")

X_train_p = preprocess_images(X_train)
X_valid_p = preprocess_images(X_valid)
X_test_p = preprocess_images(X_test)

_, axes = plt.subplots(2, 4, figsize=(12, 5))
sample_indices = [random.randint(0, len(X_train) - 1) for _ in range(4)]

for i, idx in enumerate(sample_indices):
    axes[0, i].imshow(X_train[idx])
    axes[0, i].set_title("Original", fontsize=9)
    axes[0, i].axis("off")

    axes[1, i].imshow(X_train_p[idx])
    axes[1, i].set_title("Enhanced", fontsize=9)
    axes[1, i].axis("off")

plt.suptitle("Preprocessing Effect")
plt.tight_layout()
plt.show()

print(f"Input shape: {X_train_p[0].shape}")

# ===============================================
# 6) CNN Model Architecture
# ===============================================

def create_model(input_shape, num_classes):
    inputs = keras.Input(shape=input_shape)

    x = layers.Conv2D(32, (3, 3), padding="same")(inputs)
    x = layers.BatchNormalization()(x)
    x = layers.Activation("relu")(x)
    x = layers.Conv2D(32, (3, 3), padding="same")(x)
    x = layers.BatchNormalization()(x)
    x = layers.Activation("relu")(x)
    x = layers.MaxPooling2D(2)(x)
    x = layers.Dropout(0.2)(x)

    x = layers.Conv2D(64, (3, 3), padding="same")(x)
    x = layers.BatchNormalization()(x)
    x = layers.Activation("relu")(x)
    x = layers.Conv2D(64, (3, 3), padding="same")(x)
    x = layers.BatchNormalization()(x)
    x = layers.Activation("relu")(x)
    x = layers.MaxPooling2D(2)(x)
    x = layers.Dropout(0.25)(x)

    x = layers.Conv2D(128, (3, 3), padding="same")(x)
    x = layers.BatchNormalization()(x)
    x = layers.Activation("relu")(x)

    x = layers.GlobalAveragePooling2D()(x)

    x = layers.Dense(256, activation="relu")(x)
    x = layers.Dropout(0.5)(x)

    outputs = layers.Dense(num_classes, activation="softmax")(x)

    return keras.Model(inputs, outputs)

model = create_model(X_train_p[0].shape, NUM_CLASSES)
model.summary()

# ===============================================
# 7) Model Compilation And Callbacks
# ===============================================

model.compile(
    optimizer=keras.optimizers.Adam(learning_rate=1e-3),
    loss="sparse_categorical_crossentropy",
    metrics=["accuracy"]
)

callbacks = [
    keras.callbacks.EarlyStopping(
        monitor="val_loss",
        patience=6,
        restore_best_weights=True
    ),
    keras.callbacks.ReduceLROnPlateau(
        monitor="val_loss",
        factor=0.5,
        patience=3,
        verbose=1
    )
]

# ===============================================
# 8) Model Training And Saving
# ===============================================

print("Starting training...")

history = model.fit(
    X_train_p, y_train,
    batch_size=BATCH_SIZE,
    epochs=EPOCHS,
    validation_data=(X_valid_p, y_valid),
    callbacks=callbacks,
    verbose=1
)

model.save(MODEL_PATH)
print(f"\nModel saved to {MODEL_PATH}")

try:
    from google.colab import files
    print("Downloading model...")
    files.download(MODEL_PATH)
except ImportError:
    print("Not running in Google Colab. Model is saved locally.")

# ===============================================
# 9) Training Curves Visualization
# ===============================================

_, (ax1, ax2) = plt.subplots(1, 2, figsize=(13, 5))

ax1.plot(history.history["accuracy"], label="Train")
ax1.plot(history.history["val_accuracy"], label="Validation")
ax1.set_title("Accuracy over Epochs")
ax1.set_xlabel("Epoch")
ax1.set_ylabel("Accuracy")
ax1.legend()
ax1.grid(alpha=0.3)

ax2.plot(history.history["loss"], label="Train")
ax2.plot(history.history["val_loss"], label="Validation")
ax2.set_title("Loss over Epochs")
ax2.set_xlabel("Epoch")
ax2.set_ylabel("Loss")
ax2.legend()
ax2.grid(alpha=0.3)

plt.tight_layout()
plt.show()

# ===============================================
# 10) Test Evaluation And Classification Report
# ===============================================

print("Evaluating on test set...")

test_loss, test_acc = model.evaluate(X_test_p, y_test, verbose=0)

print(f"Test Accuracy: {test_acc:.4f}")
print(f"Test Loss: {test_loss:.4f}")

y_pred = np.argmax(model.predict(X_test_p, verbose=0), axis=1)

print("\nClassification Report:\n")
print(classification_report(y_test, y_pred, zero_division=0))

# ===============================================
# 11) Confusion Matrix Visualization
# ===============================================

cm = confusion_matrix(y_test, y_pred)

plt.figure(figsize=(16, 14))
sns.heatmap(
    cm,
    cmap="Blues",
    square=True,
    xticklabels=list(label_map.values()),
    yticklabels=list(label_map.values()),
    annot=False,
    cbar_kws={"shrink": 0.7}
)

plt.xticks(rotation=90, fontsize=8)
plt.yticks(rotation=0, fontsize=8)
plt.xlabel("Predicted", fontsize=12, fontweight="bold")
plt.ylabel("Actual", fontsize=12, fontweight="bold")
plt.title("Confusion Matrix", fontsize=14, fontweight="bold")
plt.tight_layout()
plt.show()

# ===============================================
# 12) Weakest Class Analysis
# ===============================================

per_class = cm.diagonal() / cm.sum(axis=1)

worst = np.argsort(per_class)[:6]

plt.figure(figsize=(9, 4))
plt.barh(
    [label_map[i][:28] for i in worst],
    per_class[worst],
    color="salmon",
    edgecolor="black"
)
plt.xlabel("Accuracy")
plt.title("Weakest Classes")
plt.xlim(0, 1)
plt.grid(axis="x", alpha=0.3)
plt.tight_layout()
plt.show()

# ===============================================
# 13) Random Test Predictions
# ===============================================

plt.figure(figsize=(15, 10))

for i in range(12):
    idx = random.randint(0, len(X_test_p) - 1)
    plt.subplot(3, 4, i + 1)
    plt.imshow(X_test_p[idx])

    p = y_pred[idx]
    t = y_test[idx]

    color = "green" if p == t else "red"
    plt.title(
        f"P: {label_map[p][:22]}\nT: {label_map[t][:22]}",
        fontsize=8,
        color=color
    )
    plt.axis("off")

plt.suptitle("Predictions (Green = Correct, Red = Wrong)")
plt.tight_layout()
plt.show()

# ===============================================
# 14) Final Training Summary
# ===============================================

best_epoch_idx = np.argmin(history.history["val_loss"])
best_epoch = best_epoch_idx + 1

best_val_loss = history.history["val_loss"][best_epoch_idx]
best_val_acc_at_best = history.history["val_accuracy"][best_epoch_idx]

epochs_trained = len(history.history["loss"])

print("=" * 55)
print("Final Summary")
print("=" * 55)
print(f"Dataset                    : German Traffic Sign Recognition Benchmark")
print(f"Classes                    : {NUM_CLASSES}")
print(f"Train / Val / Test Samples : {len(X_train_p):,} / {len(X_valid_p):,} / {len(X_test_p):,}")
print("-" * 55)
print(f"Epochs Requested           : {EPOCHS}")
print(f"Epochs Trained             : {epochs_trained}")
print(f"Best Model Criterion       : Minimum Validation Loss")
print(f"Best Validation Epoch      : {best_epoch}")
print(f"Best Validation Loss       : {best_val_loss:.4f}")
print(f"Validation Accuracy @ Best : {best_val_acc_at_best:.4f}")
print("-" * 55)
print(f"Test Loss                  : {test_loss:.4f}")
print(f"Test Accuracy              : {test_acc:.4f}")
print(f"Total Parameters           : {model.count_params():,}")
print("-" * 55)
print("Note: Because restore_best_weights=True was used,")
print("the final test result is based on the best")
print(f"validation-loss model from epoch {best_epoch}, not the last epoch.")
print("=" * 55)
