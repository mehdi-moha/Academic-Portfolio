import numpy as np
from image_processing import reflect_pad, gaussian_kernel, convolve
from quality_metrics import psnr_score, ssim_windowed, edge_preservation_index

# ===================================================================
# DENOISING ALGORITHMS IMPLEMENTATION
# ===================================================================

def apply_gaussian_smoothing(noisy, clean, sigma):
    """
    Apply Gaussian smoothing for noise reduction.
    
    This linear filtering approach convolves the noisy image with a Gaussian
    kernel to suppress high-frequency noise while preserving low-frequency content.
    
    Parameters:
        noisy: Input noisy image
        clean: Reference clean image (for evaluation)
        sigma: Standard deviation of Gaussian kernel
    
    Returns:
        Dictionary containing processed result and quality metrics
    """
    # Generate Gaussian kernel and apply convolution
    kernel = gaussian_kernel(sigma)
    result = convolve(noisy, kernel)
    
    # Evaluate denoising performance
    psnr = psnr_score(clean, result)
    ssim = ssim_windowed(clean, result)
    edge = edge_preservation_index(clean, result)
    
    # Display progress information
    print(f"σ={sigma:.2f} → PSNR={psnr:.2f}, SSIM={ssim:.4f}, Edge={edge:.1f}%")
    
    return {
        'result': result,
        'sigma': sigma,
        'psnr': psnr,
        'ssim': ssim,
        'edge': edge
    }

def apply_linear_diffusion(noisy, clean, D, t, dt=0.20):
    """
    Apply isotropic linear diffusion (heat equation) for denoising.
    
    This method solves the heat equation ∂u/∂t = D∇²u using explicit
    finite differences, providing uniform smoothing across the image.
    
    Parameters:
        noisy: Input noisy image
        clean: Reference clean image (for evaluation)
        D: Diffusion coefficient (controls smoothing strength)
        t: Evolution time (total diffusion duration)
        dt: Time step size for numerical integration
    
    Returns:
        Dictionary containing processed result and quality metrics
    """
    def laplacian(u):
        """
        Compute discrete Laplacian using 4-neighbor stencil.
        
        Parameters:
            u: Input image
        
        Returns:
            Laplacian of the input image
        """
        padded = reflect_pad(u, 1)
        return (padded[:-2, 1:-1] + # Top neighbor
                padded[2:, 1:-1] + # Bottom neighbor
                padded[1:-1, :-2] + # Left neighbor
                padded[1:-1, 2:] - # Right neighbor
                4 * padded[1:-1, 1:-1]) # Center pixel (weighted by 4)
    
    # Numerical integration parameters
    steps = round(t / dt) # Number of time steps
    u = noisy.astype(np.float64).copy() # Working image (double precision)
    
    # Forward Euler time integration
    for _ in range(steps):
        u += dt * D * laplacian(u) # Update: u^{n+1} = u^n + dt*D*∇²u^n
    
    # Convert back to uint8 range
    result = np.clip(u, 0, 255).astype(np.uint8)
    
    # Evaluate denoising performance
    psnr = psnr_score(clean, result)
    ssim = ssim_windowed(clean, result)
    edge = edge_preservation_index(clean, result)
    
    # Display progress information
    print(f"D={D:.2f}, t={t} → PSNR={psnr:.2f}, SSIM={ssim:.4f}, Edge={edge:.1f}%")
    
    return {
        'result': result,
        'D': D,
        't': t,
        'psnr': psnr,
        'ssim': ssim,
        'edge': edge
    }

def apply_perona_malik(noisy, clean, lam, t, dt=0.20):
    """
    Apply Perona-Malik nonlinear diffusion for edge-preserving denoising.
    
    This method uses anisotropic diffusion with edge-sensitive conductivity
    to smooth homogeneous regions while preserving important edge structures.
    
    Parameters:
        noisy: Input noisy image
        clean: Reference clean image (for evaluation)
        lam: Edge threshold parameter (λ)
        t: Evolution time (total diffusion duration)
        dt: Time step size for numerical integration
    
    Returns:
        Dictionary containing processed result and quality metrics
    """
    def compute_diffusivity(u, lam):
        """
        Compute edge-sensitive diffusivity function.
        
        Uses the Perona-Malik conductivity: g(|∇u|²) = 1/(1 + |∇u|²/λ²)
        This function approaches 0 at strong edges and 1 in smooth regions.
        
        Parameters:
            u: Current image state
            lam: Edge threshold parameter
        
        Returns:
            Diffusivity map
        """
        padded = reflect_pad(u, 1)
        
        # Compute gradients using central differences
        gx = 0.5 * (padded[1:-1, 2:] - padded[1:-1, :-2]) # Horizontal gradient
        gy = 0.5 * (padded[2:, 1:-1] - padded[:-2, 1:-1]) # Vertical gradient
        
        # Gradient magnitude squared
        grad_sq = gx**2 + gy**2
        
        # Perona-Malik diffusivity function
        return 1 / (1 + (grad_sq / lam**2))

    def divergence(D, u):
        """
        Compute divergence of the diffusive flux: ∇·(D∇u).
        
        Uses finite differences with diffusivity values interpolated
        to half-grid points for numerical stability.
        
        Parameters:
            D: Diffusivity map
            u: Current image state
        
        Returns:
            Divergence of diffusive flux
        """
        # Apply padding to both diffusivity and image
        padded_u = reflect_pad(u, 1)
        padded_D = reflect_pad(D, 1)
        
        # Forward and backward differences for image gradients
        ux_fwd = padded_u[1:-1, 2:] - padded_u[1:-1, 1:-1] # Forward x-difference
        ux_back = padded_u[1:-1, 1:-1] - padded_u[1:-1, :-2] # Backward x-difference
        
        # Interpolate diffusivity to half-grid points (x-direction)
        Dx_fwd = 0.5 * (padded_D[1:-1, 2:] + padded_D[1:-1, 1:-1])
        Dx_back = 0.5 * (padded_D[1:-1, 1:-1] + padded_D[1:-1, :-2])
        
        # Same operations for y-direction
        uy_fwd = padded_u[2:, 1:-1] - padded_u[1:-1, 1:-1] # Forward y-difference
        uy_back = padded_u[1:-1, 1:-1] - padded_u[:-2, 1:-1] # Backward y-difference
        Dy_fwd = 0.5 * (padded_D[2:, 1:-1] + padded_D[1:-1, 1:-1])
        Dy_back = 0.5 * (padded_D[1:-1, 1:-1] + padded_D[:-2, 1:-1])
        
        # Compute flux divergence
        div_x = Dx_fwd * ux_fwd - Dx_back * ux_back # x-component
        div_y = Dy_fwd * uy_fwd - Dy_back * uy_back # y-component
        
        return div_x + div_y
    
    # Numerical integration parameters
    steps = round(t / dt) # Number of time steps
    u = noisy.astype(np.float64).copy() # Working image (double precision)
    
    # Forward Euler time integration with adaptive diffusivity
    for _ in range(steps):
        D = compute_diffusivity(u, lam) # Compute current diffusivity
        u += dt * divergence(D, u) # Update: u^{n+1} = u^n + dt*∇·(D∇u^n)
    
    # Convert back to uint8 range
    result = np.clip(u, 0, 255).astype(np.uint8)
    
    # Evaluate denoising performance
    psnr = psnr_score(clean, result)
    ssim = ssim_windowed(clean, result)
    edge = edge_preservation_index(clean, result)
    
    # Display progress information
    print(f"t={t}, λ={lam:.2f} → PSNR={psnr:.2f}, SSIM={ssim:.4f}, Edge={edge:.1f}%")
    
    return {
        'result': result,
        'lambda': lam,
        't': t,
        'psnr': psnr,
        'ssim': ssim,
        'edge': edge
    }