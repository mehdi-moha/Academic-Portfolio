clc;
clear;
close all;

I=imread('cameraman.tif');
imshow(I);
title('Original Image')
I=double(I);

b0=rem((fix(I/1)),2);
b1=rem((fix(I/2)),2);
b2=rem((fix(I/4)),2);
b3=rem((fix(I/8)),2);
b4=rem((fix(I/16)),2);
b5=rem((fix(I/32)),2);
b6=rem((fix(I/64)),2);
b7=rem((fix(I/128)),2);

figure;
for I=1:8
    subplot(2,4,I);
    imshow(eval(strcat('b',int2str(I-1))));
    title(strcat('b',int2str(I-1)));
end

Original_Picture=uint8((b7*(2^7))+(b6*(2^6))+(b5*(2^5))+(b4*(2^4))+(b3*(2^3))+(b2*(2^2))+(b1*(2^1))+(b0*(2^0)));
figure;
imshow(Original_Picture);
title('Reconstructed Original Picture');
