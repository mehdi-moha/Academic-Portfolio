## Contents

- [Digital Image Processing](#digital-image-processing)
- [Neural Networks](#neural-networks)

---

## Digital Image Processing

### Exercise 01: Image Enhancement and Intensity Transformations
Implementation of fundamental image processing techniques including gamma correction, JPEG compression quality analysis, RGB channel separation and manipulation, color quantization, histogram equalization, piecewise linear transformations, bit-plane slicing, and image quality metrics (MSE/PSNR). Developed in MATLAB with visual analysis of intensity mapping functions and output distribution analysis.

### Exercise 02: Spatial Filtering and Edge Detection
Implementation of spatial-domain filtering techniques for noise reduction and edge detection. Includes mean, Gaussian, and median filters for salt-and-pepper and Gaussian noise removal. Comparative analysis of edge detection methods: Sobel, Prewitt, Roberts, Canny, and Laplacian of Gaussian (LoG) operators under various noise conditions.

### Exercise 03: Morphological Operations and Advanced Filtering
Application of morphological image processing using opening and closing operations with structuring elements. Comparative evaluation of spatial filters (median, mean, Gaussian) across different kernel sizes and parameter settings. Implementation of Laplacian sharpening with 4-connectivity and 8-connectivity masks, and directional gradient filters for edge enhancement.

---

## Neural Networks

### Hopfield Shapes: Pattern Recovery From Scratch
Developed a discrete Hopfield neural network from scratch in MATLAB for associative memory and binary pattern recovery. The model uses Hebbian learning to store multiple 11×11 geometric patterns and applies synchronous neuron updates to reconstruct corrupted inputs. The implementation demonstrates successful denoising and recall of circle, square, and triangle patterns from noisy binary images, highlighting the network’s ability to perform multi-pattern associative memory without using MATLAB’s Neural Network Toolbox.

### SineNet: Function Approximation
Implementation of a feedforward neural network for sine function approximation with added noise. Network configuration: 10 hidden neurons, 60/20/20 train/validation/test split ratio. Demonstrates regression capability with visualization of predicted versus actual values.

### FFNN Regression: Multi-Input Prediction
Feedforward neural network for regression analysis using a tabular dataset with 4 input features and 1 target output. Architecture: 10 hidden neurons with tansig/purelin activation functions, MSE performance metric. Includes training/validation/test performance visualization and regression plots.

### Hopfield Digits: Pattern Recognition
Implementation of Hopfield recurrent neural network for handwritten digit recognition (0–9). Trained on binary patterns with associative memory recall mechanism. Evaluates network robustness under varying salt-and-pepper noise levels (d = 0.01 to 0.45) with iterative convergence visualization across 59 time steps.

---
