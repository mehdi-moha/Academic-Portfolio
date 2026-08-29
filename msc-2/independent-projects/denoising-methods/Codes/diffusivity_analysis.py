import numpy as np
import matplotlib.pyplot as plt
import os
from image_processing import reflect_pad

# ===================================================================
# PERONA-MALIK DIFFUSIVITY ANALYSIS ON CLEAN IMAGE
# ===================================================================

def analyze_perona_malik_diffusivity(image, lam=0.50):
    """
    Perform quantitative analysis of Perona-Malik diffusivity distribution.
    
    Compute and analyze the spatial distribution of edge-sensitive
    conductivity function D(x,y) = 1/(1 + |∇u|²/λ²) on noise-free image
    to demonstrate edge-preserving characteristics.
    
    Parameters:
    image: Input clean image for diffusivity analysis
    lam: Edge threshold parameter (λ)
    
    Returns:
    Tuple containing diffusivity map, gradient magnitude, and statistics
    """
    print(f"=== Perona-Malik Diffusivity Analysis (λ = {lam:.2f}) ===")
    
    # Input image validation
    print(f"Image shape: {image.shape}")
    print(f"Image range: {image.min():.1f} to {image.max():.1f}")
    
    # Compute gradient using central differences (consistent with main implementation)
    padded = reflect_pad(image.astype(np.float64), 1)
    
    # Central difference gradients
    gx = 0.5 * (padded[1:-1, 2:] - padded[1:-1, :-2]) # Horizontal gradient
    gy = 0.5 * (padded[2:, 1:-1] - padded[:-2, 1:-1]) # Vertical gradient
    
    # Gradient magnitude computation
    grad_sq = gx**2 + gy**2
    grad_magnitude = np.sqrt(grad_sq)
    
    print(f"Gradient magnitude range: {grad_magnitude.min():.3f} to {grad_magnitude.max():.3f}")
    
    # Perona-Malik diffusivity function: D(x,y) = 1/(1 + |∇u|²/λ²)
    D = 1.0 / (1.0 + (grad_sq / lam**2))
    
    print(f"Diffusivity range: {D.min():.4f} to {D.max():.4f}")
    
    # Statistical analysis of diffusivity distribution
    total_pixels = D.size
    edge_pixels = np.sum(D < 0.5) # Low diffusivity (edge preservation)
    smooth_pixels = np.sum(D > 0.8) # High diffusivity (smooth regions)
    medium_pixels = total_pixels - edge_pixels - smooth_pixels
    
    # Calculate region percentages
    edge_pct = (edge_pixels / total_pixels) * 100
    smooth_pct = (smooth_pixels / total_pixels) * 100
    medium_pct = (medium_pixels / total_pixels) * 100
    
    print("\nStatistical Analysis:")
    print(f"• Mean diffusivity: {D.mean():.4f}")
    print(f"• Standard deviation: {D.std():.4f}")
    print(f"• Edge regions (D < 0.5): {edge_pct:.1f}% ({edge_pixels:,} pixels)")
    print(f"• Smooth regions (D > 0.8): {smooth_pct:.1f}% ({smooth_pixels:,} pixels)")
    print(f"• Medium regions (0.5 ≤ D ≤ 0.8): {medium_pct:.1f}% ({medium_pixels:,} pixels)")
    
    # Comprehensive visualization of diffusivity analysis
    _, axes = plt.subplots(2, 3, figsize=(18, 12))
    
    # Top row: Image analysis
    axes[0,0].imshow(image, cmap='gray')
    axes[0,0].set_title('Original Office Image', fontsize=14)
    axes[0,0].axis('off')
    
    axes[0,1].imshow(grad_magnitude, cmap='hot')
    axes[0,1].set_title('Gradient Magnitude |∇u|', fontsize=14)
    axes[0,1].axis('off')
    im1 = axes[0,1].imshow(grad_magnitude, cmap='hot')
    plt.colorbar(im1, ax=axes[0,1], shrink=0.8)
    
    axes[0,2].imshow(D, cmap='gray')
    axes[0,2].set_title(f'Diffusivity Map D(x,y) (λ = {lam:.2f})\nBright = High Diffusion, Dark = Edge Preservation', fontsize=14)
    axes[0,2].axis('off')
    im2 = axes[0,2].imshow(D, cmap='gray')
    plt.colorbar(im2, ax=axes[0,2], shrink=0.8)
    
    # Bottom row: Statistical analysis
    # Diffusivity histogram with thresholds
    axes[1,0].hist(D.flatten(), bins=50, alpha=0.7, color='skyblue', edgecolor='black')
    axes[1,0].axvline(0.5, color='red', linestyle='--', linewidth=2, label='Edge threshold (0.5)')
    axes[1,0].axvline(0.8, color='green', linestyle='--', linewidth=2, label='Smooth threshold (0.8)')
    axes[1,0].axvline(D.mean(), color='orange', linestyle='-', linewidth=2, label=f'Mean ({D.mean():.3f})')
    axes[1,0].set_xlabel('Diffusivity Value', fontsize=13)
    axes[1,0].set_ylabel('Number of Pixels', fontsize=13)
    axes[1,0].set_title('Diffusivity Distribution', fontsize=14)
    axes[1,0].tick_params(axis='both', which='major', labelsize=12)
    axes[1,0].legend(fontsize=11)
    axes[1,0].grid(True, alpha=0.3)
    
    # Gradient magnitude histogram with λ threshold
    axes[1,1].hist(grad_magnitude.flatten(), bins=50, alpha=0.7, color='orange', edgecolor='black')
    axes[1,1].axvline(lam, color='red', linestyle='--', linewidth=2, label=f'λ = {lam:.2f}')
    axes[1,1].axvline(grad_magnitude.mean(), color='blue', linestyle='-', linewidth=2, 
     label=f'Mean ({grad_magnitude.mean():.2f})')
    axes[1,1].set_xlabel('Gradient Magnitude', fontsize=13)
    axes[1,1].set_ylabel('Number of Pixels', fontsize=13)
    axes[1,1].set_title('Gradient Magnitude Distribution', fontsize=14)
    axes[1,1].tick_params(axis='both', which='major', labelsize=12)
    axes[1,1].legend(fontsize=11)
    axes[1,1].grid(True, alpha=0.3)
    
    # Region classification pie chart
    sizes = [edge_pct, medium_pct, smooth_pct]
    labels = [f'Edge Regions\n({edge_pct:.1f}%)', 
     f'Medium Regions\n({medium_pct:.1f}%)', 
     f'Smooth Regions\n({smooth_pct:.1f}%)']
    colors = ['red', 'yellow', 'green']
    
    axes[1,2].pie(sizes, labels=labels, colors=colors, autopct='%1.1f%%', startangle=90, textprops={'fontsize': 12})
    axes[1,2].set_title('Region Classification Based on Diffusivity', fontsize=14)
    
    # Save individual subplots for diffusivity analysis
    os.makedirs('individual_plots', exist_ok=True)
    
    # Save original image subplot
    fig_orig, ax_orig = plt.subplots(1, 1, figsize=(6, 6))
    ax_orig.imshow(image, cmap='gray')
    ax_orig.set_title('Original Office Image', fontsize=14)
    ax_orig.axis('off')
    plt.tight_layout()
    plt.savefig('individual_plots/diffusivity_01_original.png', dpi=300, bbox_inches='tight')
    plt.close(fig_orig)
    
    # Save gradient magnitude subplot
    fig_grad, ax_grad = plt.subplots(1, 1, figsize=(6, 6))
    im_grad = ax_grad.imshow(grad_magnitude, cmap='hot')
    ax_grad.set_title('Gradient Magnitude |∇u|', fontsize=14)
    ax_grad.axis('off')
    plt.colorbar(im_grad, ax=ax_grad, shrink=0.8)
    plt.tight_layout()
    plt.savefig('individual_plots/diffusivity_02_gradient.png', dpi=300, bbox_inches='tight')
    plt.close(fig_grad)
    
    # Save diffusivity map subplot
    fig_diff, ax_diff = plt.subplots(1, 1, figsize=(6, 6))
    im_diff = ax_diff.imshow(D, cmap='gray')
    ax_diff.set_title(f'Diffusivity Map D(x,y) (λ = {lam:.2f})\nBright = High Diffusion, Dark = Edge Preservation', fontsize=14)
    ax_diff.axis('off')
    plt.colorbar(im_diff, ax=ax_diff, shrink=0.8)
    plt.tight_layout()
    plt.savefig('individual_plots/diffusivity_03_map.png', dpi=300, bbox_inches='tight')
    plt.close(fig_diff)
    
    # Save diffusivity histogram subplot
    fig_hist_diff, ax_hist_diff = plt.subplots(1, 1, figsize=(6, 5))
    ax_hist_diff.hist(D.flatten(), bins=50, alpha=0.7, color='skyblue', edgecolor='black')
    ax_hist_diff.axvline(0.5, color='red', linestyle='--', linewidth=2, label='Edge threshold (0.5)')
    ax_hist_diff.axvline(0.8, color='green', linestyle='--', linewidth=2, label='Smooth threshold (0.8)')
    ax_hist_diff.axvline(D.mean(), color='orange', linestyle='-', linewidth=2, label=f'Mean ({D.mean():.3f})')
    ax_hist_diff.set_xlabel('Diffusivity Value', fontsize=13)
    ax_hist_diff.set_ylabel('Number of Pixels', fontsize=13)
    ax_hist_diff.set_title('Diffusivity Distribution', fontsize=14)
    ax_hist_diff.tick_params(axis='both', which='major', labelsize=12)
    ax_hist_diff.legend(fontsize=11)
    ax_hist_diff.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig('individual_plots/diffusivity_04_histogram.png', dpi=300, bbox_inches='tight')
    plt.close(fig_hist_diff)
    
    # Save gradient magnitude histogram subplot
    fig_hist_grad, ax_hist_grad = plt.subplots(1, 1, figsize=(6, 5))
    ax_hist_grad.hist(grad_magnitude.flatten(), bins=50, alpha=0.7, color='orange', edgecolor='black')
    ax_hist_grad.axvline(lam, color='red', linestyle='--', linewidth=2, label=f'λ = {lam:.2f}')
    ax_hist_grad.axvline(grad_magnitude.mean(), color='blue', linestyle='-', linewidth=2, 
     label=f'Mean ({grad_magnitude.mean():.2f})')
    ax_hist_grad.set_xlabel('Gradient Magnitude', fontsize=13)
    ax_hist_grad.set_ylabel('Number of Pixels', fontsize=13)
    ax_hist_grad.set_title('Gradient Magnitude Distribution', fontsize=14)
    ax_hist_grad.tick_params(axis='both', which='major', labelsize=12)
    ax_hist_grad.legend(fontsize=11)
    ax_hist_grad.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig('individual_plots/diffusivity_05_gradient_hist.png', dpi=300, bbox_inches='tight')
    plt.close(fig_hist_grad)
    
    # Save pie chart subplot
    fig_pie, ax_pie = plt.subplots(1, 1, figsize=(6, 6))
    ax_pie.pie(sizes, labels=labels, colors=colors, autopct='%1.1f%%', startangle=90, textprops={'fontsize': 12})
    ax_pie.set_title('Region Classification Based on Diffusivity', fontsize=14)
    plt.tight_layout()
    plt.savefig('individual_plots/diffusivity_06_pie_chart.png', dpi=300, bbox_inches='tight')
    plt.close(fig_pie)
    
    plt.tight_layout()
    plt.show()
    
    print(f"""
QUANTITATIVE ANALYSIS OF PERONA-MALIK DIFFUSIVITY (λ = {lam:.2f}):

The computed diffusivity map D(x,y) on the noise-free office image reveals 
the edge-preserving characteristics of the Perona-Malik model:

• Edge-preserving regions (D < 0.5): {edge_pct:.1f}% of the image
 These correspond to areas with high gradient magnitude where diffusion 
 is suppressed to preserve structural information.

• Smooth diffusion regions (D > 0.8): {smooth_pct:.1f}% of the image 
 These represent homogeneous areas where strong diffusion occurs for 
 effective noise removal.

• Intermediate regions (0.5 ≤ D ≤ 0.8): {medium_pct:.1f}% of the image
 These areas exhibit moderate diffusion, balancing smoothing and preservation.

Statistical properties:
- Mean diffusivity coefficient: {D.mean():.4f} ± {D.std():.4f}
- Dynamic range: [{D.min():.4f}, {D.max():.4f}]

OBSERVATION: The diffusivity map clearly demonstrates the anisotropic nature 
of Perona-Malik diffusion, where the conductivity function adapts spatially 
based on local gradient information, providing strong edge preservation 
while enabling effective smoothing in homogeneous regions.
""")
    
    return D, grad_magnitude, {
        'edge_percentage': edge_pct,
        'smooth_percentage': smooth_pct,
        'medium_percentage': medium_pct,
        'mean_diffusivity': D.mean(),
        'std_diffusivity': D.std()
    }