clc;
clear;
close all;

I=imread('pout.tif');
imshow(I);
title('Original Image');

for J=0.01:0.01:0.02
    figure;
    I0=imnoise(I,'gaussian',0,J);
    imshow(I0);
    title(strcat('Noisy Image (Gaussian,d=',num2str(J),')'));
    
    figure;
    Mean_Filter(I0,3,1,2,1);
    Mean_Filter(I0,5,1,2,2);
    
    figure;
    Gaussian_Filter(I0,3,0.3,1,2,1);
    Gaussian_Filter(I0,5,0.6,1,2,2);
    
    figure;
    I1=imnoise(I,'salt & pepper',J);
    imshow(I1);
    title(strcat('Noisy Image (salt & pepper,d=',num2str(J),')'));
    
    figure;
    Mean_Filter(I1,3,1,2,1);
    Mean_Filter(I1,5,1,2,2);
    
    figure;
    Gaussian_Filter(I1,3,0.3,1,2,1);
    Gaussian_Filter(I1,5,0.6,1,2,2);
    
    figure;
    Median_Filter(I1,3,1,2,1);
    Median_Filter(I1,5,1,2,2);
end
