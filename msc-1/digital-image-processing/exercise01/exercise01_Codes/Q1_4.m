clc;
clear;
close all;

I=imread('pool.png');
for J=2:20:122
    figure;
    [x,map]=rgb2ind(I,J);
    imshow(x,map);
    title(strcat('Indexed image(',int2str(J),' Colors)'));
end
for J=2:20:122
    figure;
    [x,map]=rgb2ind(I,J);
    subplot(2,2,1);
    imshow(x);
    title('Image befor histogram equalization');
    subplot(2,2,2);
    bar(imhist(x),'b');
    title('Original Histogram');
    g=histeq(x);
    subplot(2,2,3);
    imshow(g);
    title('Image after histogram equalization');
    subplot(2,2,4);
    bar(imhist(g),'b');
    title('Equalized Histogram');
end
