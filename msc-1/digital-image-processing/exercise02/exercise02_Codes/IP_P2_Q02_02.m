clc;
clear;
close all;

I=imread('circuit.tif');
subplot(2,3,1);
imshow(I);
title('Original Image');

BW1=edge(I,'sobel');
subplot(2,3,2);
imshow(BW1);
title('Sobel Method');

BW2=edge(I,'prewitt');
subplot(2,3,3);
imshow(BW2);
title('Prewitt Method');

BW3=edge(I,'roberts');
subplot(2,3,4);
imshow(BW3);
title('Roberts Method');

BW4=edge(I,'canny');
subplot(2,3,5);
imshow(BW4);
title('Canny Method');

BW5=edge(I,'log');
subplot(2,3,6);
imshow(BW5);
title('Laplacian of Gaussian');
