clc;
clear;
close all;

I=imread('pool.png');
imshow(I);
title('RGB');

figure;
R=I(:,:,1);
imshow(R);
title('RED Channel');

figure;
G=I(:,:,2);
imshow(G);
title('Green Channel');

figure;
B=I(:,:,3);
imshow(B);
title('Blue Channel');

[m,n]=size(R);
RR=zeros(m,n);
RR=uint8(RR);
figure;
imshow(cat(3,RR,G,B));
title('Green Channel + Blue Channel');
Histogram(RR,G,B);

[m,n]=size(G);
RG=zeros(m,n);
RG=uint8(RG);
figure;
imshow(cat(3,R,RG,B));
title('Red Channel + Blue Channel');
Histogram(R,RG,B);

[m,n]=size(B);
RB=zeros(m,n);
RB=uint8(RB);
figure;
imshow(cat(3,R,G,RB));
title('Red Channel + Green Channel');
Histogram(R,G,RB);
