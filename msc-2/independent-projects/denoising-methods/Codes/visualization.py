import matplotlib.pyplot as plt
import os

# ===================================================================
# VISUALIZATION AND ANALYSIS FUNCTIONS
# ===================================================================

def display_results(clean, noisy, results, title, param_name=None, custom_titles=None, save_individual=True, experiment_name="exp"):
    """
    Create a comprehensive visualization grid showing denoising results.
    
    Display the clean reference, noisy input, and all processed results
    in an organized grid layout with quality metrics annotations.
    
    Parameters:
    clean: Reference clean image
    noisy: Input noisy image
    results: List of processing results with metrics
    title: Figure title
    param_name: Parameter name for labeling (optional)
    custom_titles: Custom titles for each result (optional)
    save_individual: Save each subplot as separate image file
    experiment_name: Name prefix for saved files
    """
    # Calculate grid dimensions (maximum 3 images per row)
    num_images = 2 + len(results)
    num_rows = (num_images + 2) // 3
    
    # Create figure and subplot grid
    fig, axes = plt.subplots(num_rows, 3, figsize=(12, 4 * num_rows))
    axes = axes.flatten()
    fig.suptitle(title, fontsize=18)
    
    # Display reference images
    axes[0].imshow(clean, cmap='gray')
    axes[0].set_title("Clean Reference", fontsize=14, pad=12)
    axes[0].axis('off')
    
    axes[1].imshow(noisy, cmap='gray')
    axes[1].set_title("Noisy Input", fontsize=14, pad=12)
    axes[1].axis('off')
    
    # Save individual subplots if requested
    if save_individual:
        # Create output directory for individual subplot images
        os.makedirs('individual_plots', exist_ok=True)
        
        # Save clean reference as separate image
        fig_clean, ax_clean = plt.subplots(1, 1, figsize=(4, 4))
        ax_clean.imshow(clean, cmap='gray')
        ax_clean.set_title("Clean Reference", fontsize=14, pad=12)
        ax_clean.axis('off')
        plt.tight_layout()
        plt.savefig(f'individual_plots/{experiment_name}_01_clean_reference.png', dpi=300, bbox_inches='tight')
        plt.close(fig_clean)
        
        # Save noisy input as separate image
        fig_noisy, ax_noisy = plt.subplots(1, 1, figsize=(4, 4))
        ax_noisy.imshow(noisy, cmap='gray')
        ax_noisy.set_title("Noisy Input", fontsize=14, pad=12)
        ax_noisy.axis('off')
        plt.tight_layout()
        plt.savefig(f'individual_plots/{experiment_name}_02_noisy_input.png', dpi=300, bbox_inches='tight')
        plt.close(fig_noisy)
    
    # Display processing results with quality metrics
    for idx, res in enumerate(results):
        axes[idx + 2].imshow(res['result'], cmap='gray')
        
        # Use custom titles if provided, otherwise use parameter-based titles
        if custom_titles:
            result_title = custom_titles[idx]
        else:
            param_val = res.get(param_name, 'N/A')
            # Format sigma, lambda, and D with 2 decimal places
            if param_name == 'sigma':
                result_title = f"σ={param_val:.2f}"
            elif param_name == 'lambda':
                result_title = f"λ={param_val:.2f}"
            elif param_name == 'D':
                result_title = f"D={param_val:.2f}"
            else:
                result_title = f"{param_name}={param_val}"
        
        full_title = f"{result_title}\nPSNR={res['psnr']:.1f} | SSIM={res['ssim']:.3f}\nEdge={res['edge']:.1f}%"
        axes[idx + 2].set_title(full_title, fontsize=12)
        axes[idx + 2].axis('off')
        
        # Save individual result subplot if requested
        if save_individual:
            fig_sub, ax_sub = plt.subplots(1, 1, figsize=(4, 4))
            ax_sub.imshow(res['result'], cmap='gray')
            ax_sub.set_title(full_title, fontsize=12)
            ax_sub.axis('off')
            plt.tight_layout()
            # Create filename with sanitized parameter values
            safe_title = result_title.replace("=", "_").replace(".", "_").replace("σ", "sigma").replace("λ", "lambda")
            plt.savefig(f'individual_plots/{experiment_name}_{idx+3:02d}_{safe_title}.png', 
                       dpi=300, bbox_inches='tight')
            plt.close(fig_sub)
    
    # Hide unused subplot positions
    for ax in axes[num_images:]:
        ax.axis('off')
    
    plt.tight_layout()
    plt.show()

def plot_metrics(results, param_name, param_key, title, save_individual=True, experiment_name="metrics"):
    """
    Generate comprehensive metric analysis plots.
    
    Create side-by-side plots showing how PSNR, SSIM, and Edge Preservation
    vary with the specified parameter across different processing results.
    
    Parameters:
    results: List of processing results
    param_name: Parameter name for axis labeling
    param_key: Dictionary key for parameter values
    title: Figure title
    save_individual: Save each subplot as separate image file
    experiment_name: Name prefix for saved files
    """
    # Extract parameter values and metrics
    params = [r[param_key] for r in results]
    psnr_vals = [r['psnr'] for r in results]
    ssim_vals = [r['ssim'] for r in results]
    edge_vals = [r['edge'] for r in results]
    
    # Create subplot grid for metrics
    fig, axes = plt.subplots(1, 3, figsize=(18, 5))
    fig.suptitle(title, fontsize=18)
    
    # PSNR trend analysis
    axes[0].plot(params, psnr_vals, 'o-', color='steelblue', linewidth=2, markersize=6)
    axes[0].set_title("Peak Signal-to-Noise Ratio", fontsize=14)
    axes[0].set_xlabel(param_name, fontsize=13)
    axes[0].set_ylabel("PSNR (dB)", fontsize=13)
    axes[0].tick_params(axis='both', which='major', labelsize=12)
    axes[0].grid(True, alpha=0.3)
    
    # SSIM trend analysis
    axes[1].plot(params, ssim_vals, 'o-', color='green', linewidth=2, markersize=6)
    axes[1].set_title("Structural Similarity Index", fontsize=14)
    axes[1].set_xlabel(param_name, fontsize=13)
    axes[1].set_ylabel("SSIM", fontsize=13)
    axes[1].tick_params(axis='both', which='major', labelsize=12)
    axes[1].grid(True, alpha=0.3)
    
    # Edge preservation analysis
    axes[2].plot(params, edge_vals, 'o-', color='orange', linewidth=2, markersize=6)
    axes[2].set_title("Edge Preservation Index", fontsize=14)
    axes[2].set_xlabel(param_name, fontsize=13)
    axes[2].set_ylabel("Edge Preservation (%)", fontsize=13)
    axes[2].tick_params(axis='both', which='major', labelsize=12)
    axes[2].grid(True, alpha=0.3)
    
    # Save individual metric plots if requested
    if save_individual:
        os.makedirs('individual_plots', exist_ok=True)
        
        # Save PSNR analysis plot
        fig_psnr, ax_psnr = plt.subplots(1, 1, figsize=(6, 5))
        ax_psnr.plot(params, psnr_vals, 'o-', color='steelblue', linewidth=2, markersize=6)
        ax_psnr.set_title("Peak Signal-to-Noise Ratio", fontsize=14)
        ax_psnr.set_xlabel(param_name, fontsize=13)
        ax_psnr.set_ylabel("PSNR (dB)", fontsize=13)
        ax_psnr.tick_params(axis='both', which='major', labelsize=12)
        ax_psnr.grid(True, alpha=0.3)
        plt.tight_layout()
        plt.savefig(f'individual_plots/{experiment_name}_01_psnr.png', dpi=300, bbox_inches='tight')
        plt.close(fig_psnr)
        
        # Save SSIM analysis plot
        fig_ssim, ax_ssim = plt.subplots(1, 1, figsize=(6, 5))
        ax_ssim.plot(params, ssim_vals, 'o-', color='green', linewidth=2, markersize=6)
        ax_ssim.set_title("Structural Similarity Index", fontsize=14)
        ax_ssim.set_xlabel(param_name, fontsize=13)
        ax_ssim.set_ylabel("SSIM", fontsize=13)
        ax_ssim.tick_params(axis='both', which='major', labelsize=12)
        ax_ssim.grid(True, alpha=0.3)
        plt.tight_layout()
        plt.savefig(f'individual_plots/{experiment_name}_02_ssim.png', dpi=300, bbox_inches='tight')
        plt.close(fig_ssim)
        
        # Save Edge Preservation analysis plot
        fig_edge, ax_edge = plt.subplots(1, 1, figsize=(6, 5))
        ax_edge.plot(params, edge_vals, 'o-', color='orange', linewidth=2, markersize=6)
        ax_edge.set_title("Edge Preservation Index", fontsize=14)
        ax_edge.set_xlabel(param_name, fontsize=13)
        ax_edge.set_ylabel("Edge Preservation (%)", fontsize=13)
        ax_edge.tick_params(axis='both', which='major', labelsize=12)
        ax_edge.grid(True, alpha=0.3)
        plt.tight_layout()
        plt.savefig(f'individual_plots/{experiment_name}_03_edge.png', dpi=300, bbox_inches='tight')
        plt.close(fig_edge)
    
    plt.tight_layout(rect=[0, 0, 1, 0.95])
    plt.show()