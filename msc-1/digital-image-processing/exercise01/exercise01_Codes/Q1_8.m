clc;
clear;
close all;

I=imread('lake.tif');
H0=imhist(I);
H1=H0;
H2=H0;
H3=H0;
H1([1:100 200:256])=0;
H2([50:100 150:200])=0;
H3([1:20 60:80 120:140 180:200 220:240])=0;

for J=1:3
    figure;
    subplot(3,2,1);
    imshow(I);
    title('Image befor histogram equalization');
    subplot(3,2,2);
    bar(H0,'b');
    title('Original Histogram');
    subplot(3,2,4);
    plot(eval(strcat('H',int2str(J))),'r');
    title('Histogram Specification');
    K=histeq(I,eval(strcat('H',int2str(J))));
    subplot(3,2,5);
    imshow(K);
    title('Image after histogram equalization');
    subplot(3,2,6);
    bar(imhist(K),'r');
    title('Equalized Histogram');
end
