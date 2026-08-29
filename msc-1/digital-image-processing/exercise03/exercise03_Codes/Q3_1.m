clc;
clear;
close all;

I=imread('egg1.gif');
subplot(1,2,1);
imshow(I);
SE=strel('disk',1);
J=imopen(I,SE);
J=imclose(J,SE);
K=medfilt2(J,[7 7]);
subplot(1,2,2);
imshow(K);
