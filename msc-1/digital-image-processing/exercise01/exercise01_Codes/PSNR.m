function [ psnr ] = PSNR(I,J)
psnr=10*log10(256^2/MSE(I,J));
end