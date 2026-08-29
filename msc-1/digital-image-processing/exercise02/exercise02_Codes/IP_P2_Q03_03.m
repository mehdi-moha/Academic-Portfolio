clc;
clear;
close all;

I=imread('circuit.tif');
subplot(2,4,1);
imshow(I);
title('Original Image');

J=imnoise(I,'salt & pepper',0.04);
subplot(2,4,2);
imshow(J);
title('Salt and Pepper Noise');

BW1=edge(J,'sobel');
subplot(2,4,3);
imshow(BW1);
title('Sobel Method');

BW2=edge(J,'prewitt');
subplot(2,4,4);
imshow(BW2);
title('Prewitt Method');

BW3=edge(J,'roberts');
subplot(2,4,5);
imshow(BW3);
title('Roberts Method');

BW4=edge(J,'canny');
subplot(2,4,6);
imshow(BW4);
title('Canny Method');

BW5=edge(J,'log');
subplot(2,4,7);
imshow(BW5);
title('Laplacian of Gaussian');
