## Contents

- [Computer Vision](#computer-vision)
- [Data Mining](#data-mining)
- [Deep Learning](#deep-learning)
- [Evolutionary Computation](#evolutionary-computation)
- [Fuzzy Methods and Systems](#fuzzy-methods-and-systems)
- [Independent Projects](#independent-projects)
- [Machine Learning](#machine-learning)
- [Robotics](#robotics)
- [Statistical Pattern Recognition](#statistical-pattern-recognition)

---

## Computer Vision

### HW2: Image Processing Fundamentals
Color space conversions (BGR/RGB/HSV/HLS), Gaussian noise injection, spatial filtering (blur/Gaussian/median with multiple kernel sizes), and Canny edge detection with parameter tuning.

### HW3: Color Analysis and Segmentation
RGB/HSV/HLS channel separation and histogram analysis, grayscale histogram equalization, and K-means color quantization (K=2,5,8) for image segmentation.

### HW4: Thresholding and Segmentation
Global and adaptive thresholding (mean/Gaussian), band thresholding, and bimodal histogram-based segmentation.

### HW5: Geometric Transformations
Affine transformations (rotation, translation), perspective correction using homography, and frame-by-frame animation generation with GIF export.

### HW6: Contour Detection and Shape Recognition
Morphological operations with closing for noise removal, contour extraction with OpenCV, Hough Circle Transform for object detection (smarties/coins with parameter optimization), and circle counting.

### Final Project: German Traffic Sign Recognition
TensorFlow/Keras CNN classifier for the GTSRB traffic sign dataset with 43 classes, trained on 34,799 training images, validated on 4,410 images, and evaluated on the official 12,630-image test set. The preprocessing pipeline applies CLAHE illumination enhancement to the Y channel in YUV color space, followed by normalization to the [0, 1] range. The 184,779-parameter CNN is built with Conv2D blocks using Batch Normalization, ReLU activations, MaxPooling, Dropout regularization, Global Average Pooling, and a final softmax output layer. Training used the Adam optimizer, sparse categorical cross-entropy loss, EarlyStopping, and ReduceLROnPlateau for up to 30 epochs, stopping after 20 epochs. Since EarlyStopping restored the best validation-loss weights, the final saved model corresponds to epoch 14, achieving 98.50% validation accuracy and 0.0464 validation loss. On the official test set, the model achieved 97.16% accuracy with a test loss of 0.1232.

---

## Data Mining

### ChiMerge Discretization (From Scratch)
**Implementation from first principles without ML libraries.** Chi-square-based algorithm for continuous attribute discretization. Manual computation of chi-square statistics and interval merging based on statistical significance threshold (χ²=5.99). Applied to Iris dataset with automated binning across all four features (sepal/petal length/width).

### DBSCAN Clustering with Animated Visualization (From Scratch)
**This project implements the DBSCAN clustering algorithm from first principles, without using machine learning libraries.** It provides a step-by-step animated visualization of density-based clustering on two synthetic datasets: a smiley face dataset and a two-spiral dataset. The implementation manually computes epsilon-neighborhoods, identifies core points using epsRadius and minPts, expands clusters through a seed list, and assigns each point one of the standard DBSCAN labels: core, border, or noise. To improve runtime during animation, neighborhood lists are precomputed before cluster expansion. The smiley face dataset uses epsRadius = 0.5 and minPts = 5, while the two-spiral dataset uses epsRadius = 0.4 and minPts = 5. Changing these parameters can affect both the number of detected clusters and the final label assigned to each point.

### Final Project: AdaBoost Classifier (From Scratch)
**A from-scratch implementation of the AdaBoost ensemble algorithm for nonlinear binary classification, without relying on machine learning libraries.** The model uses simple single-layer linear classifiers as weak learners, trained with the pseudo-inverse method and a sign-based decision function. The algorithm performs manual weighted resampling, sample weight updates, and weak learner weighting. It is evaluated on a concentric ring dataset with 230 boosting iterations and a 70/30 train-test split, and the final test accuracy is computed and visualized.

---

## Deep Learning

### HW02: Multi-Layer Perceptron Implementation (From Scratch)
**Implementation from first principles without deep learning libraries.** Manual implementation of forward propagation, backpropagation, and gradient descent with configurable architecture. Two implementation approaches:

**Version A (Cell-based):** Cell arrays for dynamic layer management (Z, W, dW, t, Y, nN). Flexible architecture with loop-based forward/backward propagation.

**Version B (Eval-based):** Dynamic variable naming with `eval()` and string-based variable generation (`makeUniqueStrings`). Programmatic layer construction with runtime variable creation.

#### Project 1: Cardiovascular Disease Prediction
Binary classification on cardiovascular dataset with outlier removal (blood pressure/height/weight validation). One-hot encoding for categorical features (cholesterol/glucose levels). Dynamic network architecture with user-defined hidden layers. Cross-entropy loss with 3000 epochs. 75/25 train-test split with confusion matrix evaluation. Learning rate μ=0.5. Implemented in both Cell-based and Eval-based versions.

#### Project 2: XOR Problem
XOR gate learning with 4 training samples [(0,0)→0, (0,1)→1, (1,0)→1, (1,1)→0]. User-configurable hidden layers. 600 epochs with μ=0.9 learning rate. Sigmoid activation with accuracy tracking. Implemented in both Cell-based and Eval-based versions.

### HW03: Persian Handwritten Digit Recognition (HODA)
Fully-connected neural network for 10-class Persian handwritten digit classification using the HODA dataset, with 10,000 training samples and 2,000 held-out test samples. Images are centrally padded to a square canvas, resized to 28×28 using area interpolation, normalized to the [0, 1] range, and flattened into 784-dimensional vectors. The model architecture is Dense(N, ReLU, MaxNorm(3)) → Dropout(0.2) → Dense(200, ReLU, MaxNorm(3)) → Dropout(0.2) → Dense(10, softmax), trained with categorical cross-entropy and Adam with learning rate 0.001 for 20 epochs using a 20% validation split from the training data. Hyperparameter optimization was performed with Comet ML Bayesian search across 5 combinations, tuning the first hidden layer size in the range [400, 650], batch size from {64, 128, 256}, and L1/L2 kernel regularization with coefficient 1e-4. ModelCheckpoint was used to save the best epoch model based on validation accuracy, and the best overall model was saved to /content/best_hoda_model.keras. The best trial used first_layer_units=619, batch_size=128, and L2 regularization, resulting in 611,925 trainable parameters and a best validation accuracy of 97.60%. On the held-out test set, the best model achieved 96.95% accuracy with a test loss of 0.2113. The project also includes training/validation loss and accuracy curves, visualization of sample training images, and prediction visualization for the first five test samples.

### HW04: Flower Species Classification
CNN-based multi-class flower species classifier using TensorFlow/Keras on the TensorFlow Flower Photos dataset with 3,670 images from 5 classes: daisy, dandelion, roses, sunflowers, and tulips. The dataset was downloaded automatically and split with a stratified 75/15/10 strategy into 2,750 training images, 547 validation images, and 373 test images while preserving class distribution. Input images were resized to 180×180 and normalized to the [0, 1] range. Data augmentation was applied only to the training set using horizontal flipping, random rotation 0.1, random zoom 0.1, and random translation 0.2, while validation and test sets used normalization only. The model is an 11,139,813-parameter CNN with four convolutional blocks using 32→64→128→256 channels, where each block contains Conv2D (without bias) → BatchNorm → ReLU → MaxPooling, followed by Flatten → Dense(512, ReLU) → Dropout(0.5) → Dense(256, ReLU) → Dropout(0.3) → Dense(5). The models were trained for up to 50 epochs using sparse categorical cross-entropy from logits, EarlyStopping with patience 7 (restoring best weights) monitoring validation accuracy, and ReduceLROnPlateau with patience 3, factor 0.5, and minimum learning rate 1e-7. The first part of the workflow used Comet ML Bayesian optimization to compare five optimizers: Adam, RMSprop, SGD, Nadam, and Adagrad. Adam, RMSprop, and Nadam used learning rate 0.001, while SGD with momentum 0.9 and Adagrad used learning rate 0.01. The best model was selected based on validation accuracy and saved to /content/best_flower_model.keras. The second part loaded the saved best model, evaluated it on the held-out test set, and performed single-image prediction with a color-coded confidence display and horizontal class-probability bar chart. The best optimizer was RMSprop, achieving 74.22% validation accuracy at epoch 45. On the test set, the best model achieved 73.73% accuracy with a test loss of 0.8542. For the sample test image, the model correctly predicted dandelion with 64.70% confidence.

### HW05: Generative Models
**DCGAN for Persian Handwritten Digit Generation:** Deep Convolutional GAN for generating Persian handwritten digits using the HODA dataset with 60,000 grayscale digit images. Each image is centered on a 62×62 square canvas based on the maximum observed height and width, 62 and 51, then resized to 32×32, normalized from [0, 1] to [-1, 1] to match the Generator’s tanh output, and loaded through a shuffled tf.data pipeline with batch size 32 and prefetching. The Generator takes a 100-dimensional noise vector and uses Dense → Reshape(8×8×256) → BatchNorm → ReLU → Conv2DTranspose(128) → BatchNorm → ReLU → Conv2DTranspose(64) → BatchNorm → ReLU → Conv2D(1, tanh), with 2,665,793 total parameters. The Discriminator uses Conv2D(64) → LeakyReLU(0.2) → Dropout(0.5) → Conv2D(128) → LeakyReLU(0.2) → Dropout(0.5) → Flatten → Dense(1, sigmoid), with 214,785 parameters. Training used binary cross-entropy and Adam optimizers for both networks with learning rate 0.0002 and β₁=0.5, along with one-sided label smoothing for real samples using label value 0.9 and a 4:1 Discriminator-to-Generator update ratio. The model was trained for 15 epochs, generated samples were visualized every 5 epochs using fixed noise, and loss curves were plotted for both networks. By the final epoch, the losses stabilized at approximately 0.6813 for the Discriminator and 0.7997 for the Generator, and the trained Generator was saved to /content/saved_models/generator.keras.

**VAE for Persian Digit Reconstruction and Generation:** Variational Autoencoder for Persian digit reconstruction and latent-space generation using the HODA dataset with 60,000 grayscale images, split into 48,000 training samples and 12,000 held-out test/validation samples. Images are centrally padded to a 62×62 square canvas based on the maximum observed height and width, 62 and 51, then resized to 28×28, and normalized to the [0, 1] range. The model uses a 16-dimensional latent space. The Encoder follows Flatten → Dense(512→256→128, ReLU) → z_mean/z_log_var → Sampling, using the reparameterization trick with log-variance clipping to [-10.0, 2.0]. The Decoder follows Dense(128→256→512, ReLU) → Dense(784, sigmoid) → Reshape(28×28). The Encoder and Decoder contain 570,272 and 568,976 trainable parameters, respectively. Training used binary cross-entropy reconstruction loss plus KL-divergence regularization, Adam with learning rate 0.001, batch size 128, pixel-level binary accuracy tracking, and EarlyStopping with patience 5 and best-weight restoration. Although training was configured for up to 50 epochs, it stopped after epoch 43, with the best validation loss obtained at epoch 38. At the best epoch, validation pixel accuracy reached 98.27%, with validation total loss 49.8769, validation reconstruction loss 39.9985, and validation KL loss 9.8784. The project includes loss and pixel-accuracy curves, reconstruction visualization, 4×4 random latent-space sampling, and separate Encoder/Decoder export as .keras files to /content/vae_models.

### Final Project: Image Captioning (Flickr8k)
Encoder–decoder image captioning model on the Flickr8k dataset using TensorFlow/Keras, with the official split of 6,000 training images, 1,000 validation images, and 1,000 test images, each associated with up to five captions. The dataset was downloaded automatically, and captions were cleaned by lowercasing, replacing hyphens, removing punctuation, filtering non-alphabetic and very short tokens, and wrapping each with startseq and endseq tokens. Xception pretrained on ImageNet was used as a fixed visual feature extractor (include_top=False, global average pooling), producing 2048-dimensional embeddings from 299×299 RGB images normalized to [-1, 1]. In total, captions were loaded for 8,092 image IDs, Xception features were extracted for 8,091 available images, the cleaned vocabulary contained 8,422 words, and the training tokenizer produced a vocabulary size of 7,321 with a maximum caption length of 35. The captioning model has 4,936,857 trainable parameters and features an image branch Input(2048) → Dropout(0.4) → Dense(256, ReLU) and a text branch Input(35) → Embedding(7321, 256) → Dropout(0.4) → LSTM(256). These branches are fused via Concatenate and followed by Dense(256, ReLU) → Dropout(0.3) → Dense(7321, softmax). Training was conducted using the tf.data API with a batch size of 256, Adam optimizer (lr=0.001), and sparse categorical cross-entropy. Configured for 20 epochs, training stopped early after 7 epochs, with EarlyStopping restoring the optimal model weights from epoch 4, achieving a best validation loss of 3.6397. Inference utilized beam search decoding with beam width 3 and repetition control; for the sample test image 3385593926_d3e9c21170.jpg, the generated caption was “two dogs play in the snow”.

---

## Evolutionary Computation

### Artificial Bee Colony (ABC)
Swarm intelligence optimization for Rastrigin function minimization. Three-phase algorithm: employed bees, onlooker bees with roulette-wheel selection, and scout bees for stagnation escape. Fitness-based probabilistic selection. 1000-iteration convergence with contour visualization. 30-bee colony with adaptive exploration-exploitation balance.

### Multiobjective Genetic Algorithm
NSGA-II implementation for constrained bi-objective optimization. Pareto front generation with non-dominated sorting. Linear inequality constraints (Ax ≤ b) and nonlinear constraint handling (2x₁ - x₂² ≤ 6). 100 population size over 50 generations. Visualization of Pareto-optimal solutions.

---

## Fuzzy Methods and Systems

### Thermal Comfort Control System
Mamdani fuzzy inference system for HVAC power dissipation control. Two inputs: Temperature (10-35°C with 5 Gaussian MFs: Cold/SlightlyCold/Neutral/SlightlyWarm/Warm) and Relative Humidity (55-95% with 3 triangular MFs: Low/Medium/High). Output: Power Dissipation (1-4 with 5 MFs: A/B/C/D/E using triangular/trapezoidal functions). 15 fuzzy rules with min-max inference and centroid defuzzification. Surface visualization of control strategy.

---

## Independent Projects

### Chest X-Ray Pneumonia Detection
PyTorch deep CNN for binary classification of chest radiographs into Normal and Pneumonia classes using the Kaggle Chest X-Ray Pneumonia dataset. Instead of relying on the predefined dataset partitions, all original train/validation/test folders were merged and rebuilt with a leakage-aware filename-derived patient/group split using StratifiedGroupKFold. A total of 5,856 images were loaded, including 1,583 Normal and 4,273 Pneumonia samples, with 3,118 unique patient/group IDs and explicit verification confirming no group overlap across splits. The final split contained 4,067 training, 907 validation, and 882 test images. The preprocessing pipeline converts images to grayscale, applies aspect-ratio-preserving square padding to 224×224, normalizes intensities, and uses light training-only augmentation including small rotations, minor translations, and slight brightness/contrast adjustment. The custom CNN consists of four convolutional blocks with 32→64→128→256 feature channels, Batch Normalization, ReLU activations, MaxPooling, Adaptive Average Pooling, and a dropout-regularized classifier. Class imbalance was handled with weighted cross-entropy loss, and the model was trained for 20 epochs using Adam with learning rate 5e-5, weight decay 1e-4, and ReduceLROnPlateau based on validation ROC-AUC. The best model was selected at epoch 20 with a validation ROC-AUC of 0.9962, and an optimized decision threshold of 0.8731 was chosen from the validation set using Youden’s J statistic. On the held-out group-level test set, the model achieved 95% accuracy, 0.9909 ROC-AUC, and 0.9966 PR-AUC, with evaluation supported by classification reports, ROC/PR curves, confusion matrix, calibration analysis, training curves, and random prediction visualizations.

### Image Denoising Methods Comparison (From Scratch with Research Report)
**Implementation from first principles with comprehensive research-style documentation.** Comprehensive analysis of linear and nonlinear diffusion techniques. Three methods: Gaussian smoothing (σ-parameter study), Linear diffusion (heat equation with D and t parameters), and Perona-Malik anisotropic diffusion (edge-preserving with λ threshold). Manual implementation of all diffusion equations and filtering algorithms. Quality metrics: PSNR, SSIM, and edge preservation index. Perona-Malik diffusivity analysis on clean images with statistical region classification (edge/smooth/medium). Comparative evaluation: Gaussian vs Linear (equivalent smoothing) and Nonlinear vs Linear (edge preservation). Visualization with contour plots and metric sensitivity analysis. Accompanied by detailed research report with methodology, results, and analysis.

### Pet Segmentation with U-Net
Semantic segmentation of pet images using a custom 7.76M-parameter U-Net implemented in PyTorch on the Oxford-IIIT Pet dataset. The official trainval split was divided into 2,944 training and 736 validation images using breed-stratified sampling, while the official 3,669-image test split was kept for final evaluation. The preprocessing pipeline uses Albumentations for aspect-ratio-preserving resizing and padding to 320×320, ImageNet-style normalization, and training-only augmentations including horizontal flipping, brightness/contrast adjustment, affine translation, scaling, and rotation. The original Oxford-IIIT Pet trimap annotations are converted into a binary segmentation task with two classes, Background and Pet, while ambiguous border regions and structural padding pixels are excluded from loss and metric computation using an ignore index of 255. The U-Net follows an encoder-decoder architecture with skip connections and 32→64→128→256→512 feature channels, using Group Normalization for stable small-batch training. The model was optimized with a combined Cross-Entropy and Focal Tversky loss and trained for 18 epochs with a batch size of 6 using AdamW, learning rate 1e-4, weight decay 1e-5, ReduceLROnPlateau, checkpointing, and mixed precision training. The best model was selected at epoch 18 with a validation mIoU of 0.9329. Inference incorporated validation-based threshold tuning (optimized to 0.50) and connected-component post-processing to remove small noise artifacts. On the official test set, the best model achieved 96.67% pixel accuracy, 92.80% mean IoU, 95.13% background IoU, 90.47% pet IoU, and 0.1812 test loss. Training curves, prediction samples, split indices, and model checkpoints were saved for reproducibility.

---

## Machine Learning

### Computer Assignment 1: Bayesian Classification (From Scratch)
Implementation from first principles without ML libraries. Multivariate Gaussian classifier with manual maximum likelihood parameter estimation. Manual covariance matrix computation and discriminant function implementation. Two-class classification with decision boundary derivation from first principles. 75/25 train-test split on 35000 samples per class. Evaluation metrics: classification accuracy and decision boundary visualization. Interactive point classification with discriminant value display.

### Computer Assignment 2: Clustering Algorithms (From Scratch)
Implementation from first principles without ML libraries.

**K-Means Clustering:** Manual implementation of iterative centroid-based clustering on 3-class synthetic data (200 samples per class with different covariance structures). Euclidean distance metric computation and centroid updates from scratch. 20 iterations with cluster assignment visualization and accuracy evaluation per class. Animated convergence with contour plots.

**Expectation-Maximization (EM):** Manual implementation of Gaussian mixture model with iterative parameter estimation from first principles. E-step: manual posterior probability computation. M-step: manual mean, covariance, and mixing coefficient updates. 50-iteration convergence with animated contour evolution and GIF generation.

### Computer Assignment 3: Dimensionality Reduction and Multi-Classifier Comparison
Iris dataset classification with dimensionality reduction techniques. PCA and Kernel PCA are applied after data standardization. Feature space: 4 standardized original features + 3 PCA components + 3 Kernel PCA components (Gaussian/RBF kernel with gamma = 1 / number_of_features) = 10 total features.

**Dual implementation:**
- **MATLAB version:** Built-in classifiers (fitcdiscr, fitcnb, fitcecoc, patternnet, fitctree) on 50/50 random split
- **Python version:** scikit-learn classifiers (LDA, Naive Bayes, SVM, Neural Network (2 hidden layers: 7-3 units), Decision Tree) on 50/50 random split

Training and testing MSE evaluation. The workflow includes data loading, train-test splitting, standardization, PCA, Kernel PCA, feature combination, classification, and performance evaluation in both MATLAB and Python.

---

## Robotics

### Grid Wall Following
Implementation of wall-following algorithms for maze navigation. Right-hand and left-hand rule strategies with directional priority (N/E/S/W). State-based navigation with visited cell tracking to prevent infinite loops. Three test mazes with varying complexity (7×7, 9×9, 15×15 grids). Animated path visualization with step-by-step progression. Performance metrics: success rate, path length, and mean steps. Maximum iteration limit (2000 steps) for termination guarantee.

**RRP Robot Kinematics Analysis**
Analytical derivation and computational simulation of forward and inverse kinematics for a custom 3-DOF RRP (Rotational-Rotational-Prismatic) robotic arm. Step-by-step mathematical extraction of frame transformation matrices ($^0T_3$) for direct end-effector positioning. Algebraic and geometric solutions for inverse kinematics to determine joint variables with multiple configuration handling (elbow-up/elbow-down). Mathematical formulation of XY-plane reachable workspace conditions. 3D MATLAB animation visualizing theoretical equations, arm configurations, and targeted coordinate reaching.

**PUMA 560 Workspace Simulation**
Forward kinematics computation and dynamic workspace tracking for the 6-DOF PUMA 560 industrial manipulator. Implementation of cumulative transformation matrices utilizing standard Denavit-Hartenberg (D-H) parameters. Generation of continuous motion trajectories for joint angles to evaluate reachability. Real-time 3D animated visualization of multi-link spatial movements and end-effector trace rendering. Designed to validate structural geometry limits and visual simulation of rotational robotic joints.

---

## Statistical Pattern Recognition

### Computer Assignment 1: Parametric Classification (From Scratch)
**Implementation from first principles without ML libraries.** Bayesian classifiers with Maximum Likelihood Estimation.

**Exercise 1:** Textbook problem 2.5 - multivariate Gaussian with three discriminant functions (Bayes/Mahalanobis/Euclidean) on synthetic 3-class data.

**Iris Dataset (4D, 3 classes, 150 samples):** LOO cross-validation with manual MLE for mean/covariance. Deliverables: parameters for first classifier, misclassification list with discriminant values, confusion matrix.

**Liquid Dataset (6D, 3 classes, 178 samples):** LOO with manual parameter estimation. Same deliverables as Iris.

**Normal Dataset (2D, 2 classes):** Known parameters. Train on 1000 samples, test on 1000. Deliverables: scatter plot with misclassifications highlighted, empirical vs theoretical error rates.

### Computer Assignment 2: K-Nearest Neighbors & Minimum Mean Distance (From Scratch)
**Implementation from first principles without ML libraries.** Non-parametric classifiers on three datasets.

**KNN (k=1,2,3):** Manual Euclidean distance, Parzen window volume, likelihood ratios. LOO for Iris/Liquid, test set for Normal.

**Minimum Mean Distance:** Mahalanobis (MMD) and Euclidean (MED) distance to class centroids. LOO for Iris/Liquid, test set for Normal.

### Computer Assignment 3: Linear Discriminant Functions (From Scratch)
**Implementation from first principles without ML libraries.** Linear classifiers on 4-class synthetic data (10 samples/class, 2D).

**Problem 1:** Perceptron with batch gradient descent and adaptive learning rate (ρ=c/t). Two binary problems: ω₁ vs ω₂ and ω₃ vs ω₂. Includes two implementations:
- Standard algorithmic solver.
- Interactive geometric visualizer demonstrating real-time vector updates (rotation and translation).

**Problem 2:** Least Squares closed-form solution w=(X'X)⁻¹X'y for same two problems.

**Problem 3:** Multi-category logistic discrimination with softmax. One-vs-rest (4 classifiers) and one-vs-one (6 pairwise classifiers). Includes complete spatial visualization to identify and map ambiguous decision regions. Convergence criterion |Δw|<10⁻⁶.

### Computer Assignment 4: Multi-Layer Perceptron (From Scratch)
**Implementation from first principles without deep learning libraries.** Backpropagation on Normal dataset.

**Architecture:** 3-4-2 network (input with bias, hidden with bias, output). Sigmoid activation throughout.

**Training:** 1000 samples normalized to [0.2, 0.8]. Targets: (0.95, 0.05) for class 1, (0.05, 0.95) for class 2. Adaptive learning rate (η₀=0.2, adjusted via ri=1.05/rd=0.7 based on J(t)/J(t-1)). Maximum 500 epochs.

**Deliverables:** Trained weights, confusion matrix, misclassification list.

### Final Project: Diabetes Prediction Analysis
Comparative study for diabetes prediction using supervised machine learning models in scikit-learn. The dataset was cleaned, categorical variables were encoded, numerical features were standardized with StandardScaler, and class imbalance in the training set was handled using SMOTENC. Feature importance analysis and feature selection were performed with ExtraTreesClassifier, resulting in the selection of age, HbA1c_level, and blood_glucose_level as the most important predictors.

The evaluated models include Gaussian Naive Bayes, KNN, SVM with RBF kernel, Logistic Regression, AdaBoost, Decision Tree, and MLPClassifier. Performance was assessed using accuracy, precision, recall, F1-score, confusion matrices, and classification reports. Among the evaluated models, Decision Tree achieved the best overall performance, while SVM obtained the highest recall for the diabetic class, making it more suitable for screening-oriented applications.

---
