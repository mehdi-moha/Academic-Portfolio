clc;
clear;
close all;

I=imread('peppers.gif');
for K=1:5
    J=imread(strcat('peppers',int2str(K),'.gif'));
    figure;
    subplot(1,2,1);
    imshow(I);
    title('Original Image');
    subplot(1,2,2);
    imshow(J);
    title(strcat('MSE=',num2str(MSE(I,J)),',','PSNR=',num2str(PSNR(I,J))));
end
