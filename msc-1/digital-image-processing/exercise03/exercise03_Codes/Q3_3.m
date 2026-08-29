clc;
clear;
close all;

W4=[0 1 0;1 -4 1;0 1 0];
W8=[1 1 1;1 -8 1;1 1 1];

I=imread('Baboon.tif');
f1=im2double(I);

subplot(1,2,1);
imshow(I);
g1=imfilter(f1,W4,'replicate');
subplot(1,2,2);
imshow(f1-g1);

figure;
subplot(1,2,1);
imshow(I);
g2=imfilter(f1,W8,'replicate');
subplot(1,2,2);
imshow(f1-g2);
