import numpy as np
import cv2
from image_processing import gaussian_kernel, convolve

# ===================================================================
# IMAGE QUALITY ASSESSMENT METRICS
# ===================================================================

def psnr_score(ref, out):
    """
    Compute Peak Signal-to-Noise Ratio (PSNR) for image quality assessment.
    
    PSNR quantifies reconstruction quality by comparing pixel-wise differences
    between reference and processed images. Higher values indicate better quality.
    
    Parameters:
        ref: Reference (ground truth) image
        out: Processed image to evaluate
    
    Returns:
        PSNR value in decibels (dB)
    """
    mse = np.mean((ref - out) ** 2) # Mean Squared Error
    
    if mse == 0:
        return float("inf") # Perfect reconstruction
    
    # PSNR formula: 20 * log10(MAX_PIXEL_VALUE / RMSE)
    return 20 * np.log10(255.0 / np.sqrt(mse))

def ssim_windowed(x, y, sigma=1.50, C1=None, C2=None):
    """
    Calculate Structural Similarity Index (SSIM) using Gaussian weighting.
    
    SSIM evaluates perceptual image quality by comparing luminance, contrast,
    and structural information between images. Values range from -1 to 1,
    with 1 indicating perfect structural similarity.
    
    Parameters:
        x, y: Images to compare
        sigma: Standard deviation for Gaussian window
        C1, C2: Stability constants for numerical robustness
    
    Returns:
        Mean SSIM value across the image
    """
    x = x.astype(np.float64)
    y = y.astype(np.float64)
    
    # Set stability constants if not provided
    if C1 is None:
        C1 = (0.01 * 255) ** 2 # Luminance stability constant
    if C2 is None:
        C2 = (0.03 * 255) ** 2 # Contrast stability constant
    
    # Gaussian weighting window
    window = gaussian_kernel(sigma)
    
    # Local statistics computation
    mu_x = convolve(x, window) # Local mean of x
    mu_y = convolve(y, window) # Local mean of y
    mu_x_sq = mu_x * mu_x # Squared mean of x
    mu_y_sq = mu_y * mu_y # Squared mean of y
    mu_xy = mu_x * mu_y # Cross-correlation of means
    
    # Local variance and covariance
    sigma_x_sq = convolve(x * x, window) - mu_x_sq # Variance of x
    sigma_y_sq = convolve(y * y, window) - mu_y_sq # Variance of y
    sigma_xy = convolve(x * y, window) - mu_xy # Covariance of x and y
    
    # SSIM formula components
    numerator = (2 * mu_xy + C1) * (2 * sigma_xy + C2)
    denominator = (mu_x_sq + mu_y_sq + C1) * (sigma_x_sq + sigma_y_sq + C2)
    
    # Compute SSIM map and return mean value
    ssim_map = numerator / (denominator + 1e-10) # Avoid division by zero
    return np.mean(ssim_map)

def edge_preservation_index(orig, filt):
    """
    Evaluate how well edge structures are preserved during filtering.
    
    This metric uses Sobel edge detection to create binary edge maps,
    then computes the overlap ratio between original and filtered edges.
    Higher percentages indicate better edge preservation.
    
    Parameters:
        orig: Original image
        filt: Filtered image
    
    Returns:
        Edge preservation percentage (0-100%)
    """
    def sobel_magnitude(img):
        """
        Compute gradient magnitude using Sobel operators.
        
        Parameters:
            img: Input image
        
        Returns:
            Gradient magnitude map
        """
        img = img.astype(np.float32)
        
        # Sobel kernels for gradient computation
        gx = np.array([[1, 0, -1], [2, 0, -2], [1, 0, -1]]) # Horizontal gradient
        gy = gx.T # Vertical gradient
        
        # Apply reflection padding
        padded = np.pad(img, 1, mode='reflect')
        
        # Compute gradients using convolution
        dx = cv2.filter2D(padded, -1, gx)[1:-1, 1:-1]
        dy = cv2.filter2D(padded, -1, gy)[1:-1, 1:-1]
        
        # Return gradient magnitude
        return np.hypot(dx, dy)
    
    # Compute gradient magnitudes for both images
    e1 = sobel_magnitude(orig)
    e2 = sobel_magnitude(filt)
    
    # Create binary edge maps using threshold
    mask1 = (e1 > 20).astype(np.uint8) # Original edges
    mask2 = (e2 > 20).astype(np.uint8) # Filtered edges
    
    # Calculate edge preservation ratio
    overlap = np.sum(mask1 * mask2) # Common edges
    total = np.sum(mask1) + 1e-8 # Total original edges (avoid division by zero)
    
    return (overlap / total) * 100