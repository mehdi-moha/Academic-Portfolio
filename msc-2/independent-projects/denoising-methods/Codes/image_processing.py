import numpy as np

# ===================================================================
# UTILITY FUNCTIONS FOR IMAGE PROCESSING
# ===================================================================

def reflect_pad(img, pad):
    """
    Apply symmetric reflection padding to handle image boundaries.
    
    This padding strategy mirrors pixel values at borders to prevent
    edge artifacts during filtering operations.
    
    Parameters:
        img: Input image array
        pad: Padding width in pixels
    
    Returns:
        Padded image with reflected boundaries
    """
    h, w = img.shape
    out = np.zeros((h + 2 * pad, w + 2 * pad), dtype=img.dtype)
    
    # Place original image in center
    out[pad:-pad, pad:-pad] = img
    
    # Reflect borders symmetrically
    out[:pad, pad:-pad] = img[pad-1::-1, :] # Top reflection
    out[-pad:, pad:-pad] = img[-1:-pad-1:-1, :] # Bottom reflection
    out[:, :pad] = out[:, 2*pad-1:pad-1:-1] # Left reflection
    out[:, -pad:] = out[:, -pad-1:-2*pad-1:-1] # Right reflection
    
    return out

def gaussian_kernel(sigma):
    """
    Generate a normalized 2D Gaussian kernel for smoothing operations.
    
    The kernel size is automatically determined using the 3-sigma rule
    to capture 99.7% of the Gaussian distribution energy.
    
    Parameters:
        sigma: Standard deviation of the Gaussian distribution
    
    Returns:
        Normalized 2D Gaussian kernel
    """
    # Determine kernel size based on 3-sigma rule
    size = int(2 * np.ceil(3 * sigma) + 1)
    ax = np.arange(-(size // 2), size // 2 + 1)
    xx, yy = np.meshgrid(ax, ax)
    
    # Compute 2D Gaussian function
    k = np.exp(-(xx**2 + yy**2) / (2 * sigma**2))
    
    # Normalize to unit sum
    return k / np.sum(k)

def convolve(img, kernel):
    """
    Perform 2D convolution with reflection padding for boundary handling.
    
    This implementation provides full control over the convolution process
    without relying on external optimized libraries.
    
    Parameters:
        img: Input image
        kernel: Convolution kernel
    
    Returns:
        Convolved image result
    """
    k = kernel.shape[0]
    pad = k // 2
    padded = reflect_pad(img, pad)
    out = np.zeros_like(img, dtype=np.float32)
    
    # Sliding window convolution using element-wise operations
    for i in range(img.shape[0]):
        for j in range(img.shape[1]):
            region = padded[i:i + k, j:j + k]
            out[i, j] = np.sum(region * kernel) # Element-wise multiplication and summation
    
    return out