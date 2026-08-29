def main():
	import numpy as np
	import cv2
	import matplotlib.pyplot as plt
	import os

	# Import modules
	from denoising_algorithms import apply_gaussian_smoothing, apply_linear_diffusion, apply_perona_malik
	from visualization import display_results, plot_metrics
	from diffusivity_analysis import analyze_perona_malik_diffusivity

	# ===================================================================
	# IMAGE DENOISING COMPARISON: GAUSSIAN, LINEAR & NONLINEAR DIFFUSION
	# ===================================================================

	# Load grayscale input images
	# Ground truth image (clean reference)
	clean = cv2.imread("office.png", cv2.IMREAD_GRAYSCALE).astype(np.float32)

	# Corrupted input image (noisy version)
	noisy = cv2.imread("office_noisy.png", cv2.IMREAD_GRAYSCALE).astype(np.float32)

	# ===================================================================
	# EXPERIMENTAL EVALUATION AND COMPARISON
	# ===================================================================

	print("=== Gaussian Smoothing Evaluation ===")
	# In our study, Gaussian smoothing was applied with different sigma values
	gaussian_results = []
	for sigma in [0.50, 1.00, 2.00, 5.00, 10.00]:
		result = apply_gaussian_smoothing(noisy, clean, sigma)
		gaussian_results.append(result)

	display_results(clean, noisy, gaussian_results, 
		"Gaussian Smoothing: Effect of Standard Deviation", "sigma",
		experiment_name="gaussian_smoothing")

	plot_metrics(gaussian_results, "Standard Deviation (σ)", "sigma", 
		"Gaussian Smoothing: Parameter Sensitivity Analysis",
		experiment_name="gaussian_metrics")

	print("\n=== Linear Diffusion (Time Evolution) ===")
	# The time evolution analysis was performed with constant diffusion coefficient
	linear_results = []
	for t in [1, 5, 10, 30, 100]:
		result = apply_linear_diffusion(noisy, clean, D=1.00, t=t)
		linear_results.append(result)

	display_results(clean, noisy, linear_results, 
		"Linear Diffusion (D = 1.00): Temporal Evolution", "t",
		experiment_name="linear_diffusion_time")

	plot_metrics(linear_results, "Evolution Time (t)", "t", 
		"Linear Diffusion (D = 1.00): Temporal Performance Analysis",
		experiment_name="linear_time_metrics")

	print("\n=== Linear Diffusion (Coefficient Comparison) ===")
	# Different diffusion coefficients were compared at fixed time
	linear_D_results = []
	for D in [1.00, 5.00, 10.00]:
		result = apply_linear_diffusion(noisy, clean, D=D, t=10)
		linear_D_results.append(result)

	display_results(clean, noisy, linear_D_results, 
		"Linear Diffusion (t = 10): Effect of Diffusion Coefficient", "D",
		experiment_name="linear_diffusion_coeff")

	plot_metrics(linear_D_results, "Diffusion Coefficient (D)", "D", 
		"Linear Diffusion (t = 10): Coefficient Sensitivity Analysis",
		experiment_name="linear_coeff_metrics")

	print("\n=== Perona-Malik (Time Evolution) ===")
	# Perona-Malik temporal evolution was analyzed with fixed edge threshold
	perona_results = []
	for t in [1, 5, 10, 30, 100]:
		result = apply_perona_malik(noisy, clean, lam=0.50, t=t)
		perona_results.append(result)

	display_results(clean, noisy, perona_results, 
		"Perona-Malik (λ = 0.50): Temporal Evolution", "t",
		experiment_name="perona_malik_time")

	plot_metrics(perona_results, "Evolution Time (t)", "t", 
		"Perona-Malik (λ = 0.50): Temporal Performance Analysis",
		experiment_name="perona_time_metrics")

	print("\n=== Perona-Malik (Edge Threshold Analysis) ===")
	# The edge threshold parameter was varied to study its effect
	perona_lambda_results = []
	for lam in [0.50, 1.00, 2.00, 5.00, 10.00]:
		result = apply_perona_malik(noisy, clean, lam=lam, t=10)
		perona_lambda_results.append(result)

	display_results(clean, noisy, perona_lambda_results, 
		"Perona-Malik (t = 10): Effect of Edge Threshold λ", "lambda",
		experiment_name="perona_malik_lambda")

	plot_metrics(perona_lambda_results, "Edge Threshold (λ)", "lambda", 
		"Perona-Malik (t = 10): Edge Threshold Sensitivity Analysis",
		experiment_name="perona_lambda_metrics")

	# ===================================================================
	# COMPARATIVE ANALYSIS BETWEEN METHODS
	# ===================================================================

	print("\n=== Cross-Method Performance Comparison ===")

	# Gaussian vs Linear Diffusion (Equivalent Smoothing)
	# Theoretical equivalence: σ² = 2Dt for matching smoothing strength
	t = 20
	D = 1.00
	sigma = np.sqrt(2 * D * t)
	gauss_comp = apply_gaussian_smoothing(noisy, clean, sigma)
	linear_comp = apply_linear_diffusion(noisy, clean, D=D, t=t)

	# Display comparison images
	comparison_results = [gauss_comp, linear_comp]
	comparison_titles = [f"Gaussian (σ={sigma:.2f})", f"Linear Diffusion (D={D:.2f}, t={t})"]
	display_results(clean, noisy, comparison_results, 
		"Gaussian vs Linear Diffusion: Equivalent Smoothing Comparison",
		custom_titles=comparison_titles,
		experiment_name="gaussian_vs_linear")

	methods = [f"Gaussian (σ={sigma:.2f})", f"Linear Diffusion (D={D:.2f}, t={t})"]
	psnr_vals = [gauss_comp['psnr'], linear_comp['psnr']]
	ssim_vals = [gauss_comp['ssim'], linear_comp['ssim']]
	edge_vals = [gauss_comp['edge'], linear_comp['edge']]

	x = np.arange(len(methods))
	width = 0.6

	fig, axs = plt.subplots(1, 3, figsize=(15, 5))
	fig.suptitle("Gaussian vs Linear Diffusion: Equivalent Smoothing Comparison", fontsize=17)

	axs[0].bar(x, psnr_vals, width, color='steelblue', alpha=0.8)
	axs[0].set_title("PSNR Performance", fontsize=14)
	axs[0].set_ylabel("PSNR (dB)", fontsize=13)
	axs[0].tick_params(axis='both', which='major', labelsize=12)

	axs[1].bar(x, ssim_vals, width, color='green', alpha=0.8)
	axs[1].set_title("Structural Similarity", fontsize=14)
	axs[1].set_ylabel("SSIM", fontsize=13)
	axs[1].tick_params(axis='both', which='major', labelsize=12)

	axs[2].bar(x, edge_vals, width, color='orange', alpha=0.8)
	axs[2].set_title("Edge Preservation", fontsize=14)
	axs[2].set_ylabel("Edge Preservation (%)", fontsize=13)
	axs[2].tick_params(axis='both', which='major', labelsize=12)

	for ax in axs.flat:
		ax.set_xticks(x)
		ax.set_xticklabels(methods, rotation=10, fontsize=11)
		ax.grid(True, axis='y', linestyle='--', alpha=0.5)

	# Save individual comparison bar charts
	os.makedirs('individual_plots', exist_ok=True)
	
	# Save PSNR comparison bar chart
	fig_psnr_comp, ax_psnr_comp = plt.subplots(1, 1, figsize=(5, 5))
	ax_psnr_comp.bar(x, psnr_vals, width, color='steelblue', alpha=0.8)
	ax_psnr_comp.set_title("PSNR Performance", fontsize=14)
	ax_psnr_comp.set_ylabel("PSNR (dB)", fontsize=13)
	ax_psnr_comp.set_xticks(x)
	ax_psnr_comp.set_xticklabels(methods, rotation=10, fontsize=11)
	ax_psnr_comp.grid(True, axis='y', linestyle='--', alpha=0.5)
	plt.tight_layout()
	plt.savefig('individual_plots/gaussian_vs_linear_01_psnr.png', dpi=300, bbox_inches='tight')
	plt.close(fig_psnr_comp)
	
	# Save SSIM comparison bar chart
	fig_ssim_comp, ax_ssim_comp = plt.subplots(1, 1, figsize=(5, 5))
	ax_ssim_comp.bar(x, ssim_vals, width, color='green', alpha=0.8)
	ax_ssim_comp.set_title("Structural Similarity", fontsize=14)
	ax_ssim_comp.set_ylabel("SSIM", fontsize=13)
	ax_ssim_comp.set_xticks(x)
	ax_ssim_comp.set_xticklabels(methods, rotation=10, fontsize=11)
	ax_ssim_comp.grid(True, axis='y', linestyle='--', alpha=0.5)
	plt.tight_layout()
	plt.savefig('individual_plots/gaussian_vs_linear_02_ssim.png', dpi=300, bbox_inches='tight')
	plt.close(fig_ssim_comp)
	
	# Save Edge Preservation comparison bar chart
	fig_edge_comp, ax_edge_comp = plt.subplots(1, 1, figsize=(5, 5))
	ax_edge_comp.bar(x, edge_vals, width, color='orange', alpha=0.8)
	ax_edge_comp.set_title("Edge Preservation", fontsize=14)
	ax_edge_comp.set_ylabel("Edge Preservation (%)", fontsize=13)
	ax_edge_comp.set_xticks(x)
	ax_edge_comp.set_xticklabels(methods, rotation=10, fontsize=11)
	ax_edge_comp.grid(True, axis='y', linestyle='--', alpha=0.5)
	plt.tight_layout()
	plt.savefig('individual_plots/gaussian_vs_linear_03_edge.png', dpi=300, bbox_inches='tight')
	plt.close(fig_edge_comp)

	plt.tight_layout(rect=[0, 0, 1, 0.95])
	plt.show()

	# Perona-Malik vs Linear Diffusion (Edge Preservation Focus)
	lam = 0.50
	t = 10
	D = 1.00
	perona_comp = apply_perona_malik(noisy, clean, lam=lam, t=t)
	linear_comp = apply_linear_diffusion(noisy, clean, D=D, t=t)

	# Display comparison images
	comparison_results = [perona_comp, linear_comp]
	comparison_titles = [f"Perona–Malik (t={t}, λ={lam:.2f})", f"Linear Diffusion (D={D:.2f}, t={t})"]
	display_results(clean, noisy, comparison_results,
		"Nonlinear vs Linear Diffusion: Edge-Preserving Performance",
		custom_titles=comparison_titles,
		experiment_name="perona_vs_linear")

	methods = [f"Perona–Malik (t={t}, λ={lam:.2f})", f"Linear Diffusion (D={D:.2f}, t={t})"]
	psnr_vals = [perona_comp['psnr'], linear_comp['psnr']]
	ssim_vals = [perona_comp['ssim'], linear_comp['ssim']]
	edge_vals = [perona_comp['edge'], linear_comp['edge']]

	fig, axs = plt.subplots(1, 3, figsize=(15, 5))
	fig.suptitle("Nonlinear vs Linear Diffusion: Edge-Preserving Performance", fontsize=17)

	axs[0].bar(x, psnr_vals, width, color='steelblue', alpha=0.8)
	axs[0].set_title("PSNR Performance", fontsize=14)
	axs[0].set_ylabel("PSNR (dB)", fontsize=13)
	axs[0].tick_params(axis='both', which='major', labelsize=12)

	axs[1].bar(x, ssim_vals, width, color='green', alpha=0.8)
	axs[1].set_title("Structural Similarity", fontsize=14)
	axs[1].set_ylabel("SSIM", fontsize=13)
	axs[1].tick_params(axis='both', which='major', labelsize=12)

	axs[2].bar(x, edge_vals, width, color='orange', alpha=0.8)
	axs[2].set_title("Edge Preservation", fontsize=14)
	axs[2].set_ylabel("Edge Preservation (%)", fontsize=13)
	axs[2].tick_params(axis='both', which='major', labelsize=12)

	for ax in axs.flat:
		ax.set_xticks(x)
		ax.set_xticklabels(methods, rotation=10, fontsize=11)
		ax.grid(True, axis='y', linestyle='--', alpha=0.5)

	# Save individual comparison bar charts for Perona-Malik vs Linear
	# Save PSNR comparison bar chart
	fig_psnr_comp2, ax_psnr_comp2 = plt.subplots(1, 1, figsize=(5, 5))
	ax_psnr_comp2.bar(x, psnr_vals, width, color='steelblue', alpha=0.8)
	ax_psnr_comp2.set_title("PSNR Performance", fontsize=14)
	ax_psnr_comp2.set_ylabel("PSNR (dB)", fontsize=13)
	ax_psnr_comp2.set_xticks(x)
	ax_psnr_comp2.set_xticklabels(methods, rotation=10, fontsize=11)
	ax_psnr_comp2.grid(True, axis='y', linestyle='--', alpha=0.5)
	plt.tight_layout()
	plt.savefig('individual_plots/perona_vs_linear_01_psnr.png', dpi=300, bbox_inches='tight')
	plt.close(fig_psnr_comp2)
	
	# Save SSIM comparison bar chart
	fig_ssim_comp2, ax_ssim_comp2 = plt.subplots(1, 1, figsize=(5, 5))
	ax_ssim_comp2.bar(x, ssim_vals, width, color='green', alpha=0.8)
	ax_ssim_comp2.set_title("Structural Similarity", fontsize=14)
	ax_ssim_comp2.set_ylabel("SSIM", fontsize=13)
	ax_ssim_comp2.set_xticks(x)
	ax_ssim_comp2.set_xticklabels(methods, rotation=10, fontsize=11)
	ax_ssim_comp2.grid(True, axis='y', linestyle='--', alpha=0.5)
	plt.tight_layout()
	plt.savefig('individual_plots/perona_vs_linear_02_ssim.png', dpi=300, bbox_inches='tight')
	plt.close(fig_ssim_comp2)
	
	# Save Edge Preservation comparison bar chart
	fig_edge_comp2, ax_edge_comp2 = plt.subplots(1, 1, figsize=(5, 5))
	ax_edge_comp2.bar(x, edge_vals, width, color='orange', alpha=0.8)
	ax_edge_comp2.set_title("Edge Preservation", fontsize=14)
	ax_edge_comp2.set_ylabel("Edge Preservation (%)", fontsize=13)
	ax_edge_comp2.set_xticks(x)
	ax_edge_comp2.set_xticklabels(methods, rotation=10, fontsize=11)
	ax_edge_comp2.grid(True, axis='y', linestyle='--', alpha=0.5)
	plt.tight_layout()
	plt.savefig('individual_plots/perona_vs_linear_03_edge.png', dpi=300, bbox_inches='tight')
	plt.close(fig_edge_comp2)

	plt.tight_layout(rect=[0, 0, 1, 0.94])
	plt.show()

	# Execute diffusivity analysis on clean office image
	print("\n=== DIFFUSIVITY ANALYSIS FOR PERONA-MALIK MODEL ===")

	D, grad_mag, stats = analyze_perona_malik_diffusivity(clean, lam=0.50)

	# Additional gradient statistics for validation
	print("\nGradient statistics:")
	print(f"- Mean gradient: {grad_mag.mean():.3f}")
	print(f"- Gradient > λ: {np.sum(grad_mag > 0.50)/grad_mag.size*100:.1f}%")
	print(f"- Maximum gradient: {grad_mag.max():.3f}")

	print("\n=== EXPERIMENTAL ANALYSIS COMPLETED ===")
	print("All denoising methods have been evaluated and compared successfully.")
	print("The results demonstrate the effectiveness of each approach under different conditions.")