clc;
clear;
close all;

I=imread('leg1.gif');

figure;
subplot(1,3,1);
imshow(I);
title('Original Image');

I=im2single(I);

subplot(1,3,2);
imshow(gamma_correction(1,I,2));
title('Exponential Function');

subplot(1,3,3);
imshow(gamma_correction(1,I,0.5));
title('Logarithmic Function');
