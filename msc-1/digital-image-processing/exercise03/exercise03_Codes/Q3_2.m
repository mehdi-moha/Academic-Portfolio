clc;
clear;
close all;

I1=imread('barbara.gif');
I2=imnoise(I1,'salt & pepper',0.02);
I3=imnoise(I1,'gaussian',0,0.02);

for I=1:3
    subplot(3,1,I);
    imshow(eval(strcat('I',int2str(I))));
end

for I=2:3
    figure
    Median_Filter(I1,eval(strcat('I',int2str(I))),3,3,1,1);
    Median_Filter(I1,eval(strcat('I',int2str(I))),5,3,1,2);
    Median_Filter(I1,eval(strcat('I',int2str(I))),7,3,1,3);
    figure;
    Mean_Filter(I1,eval(strcat('I',int2str(I))),3,3,1,1);
    Mean_Filter(I1,eval(strcat('I',int2str(I))),5,3,1,2);
    Mean_Filter(I1,eval(strcat('I',int2str(I))),7,3,1,3);
    figure;
    Gaussian_Filter(I1,eval(strcat('I',int2str(I))),5,0.3,3,1,1);
    Gaussian_Filter(I1,eval(strcat('I',int2str(I))),5,0.6,3,1,2);
    Gaussian_Filter(I1,eval(strcat('I',int2str(I))),5,0.9,3,1,3);
end

I1=imread('cameraman.tif');
I2=imnoise(I1,'salt & pepper',0.02);
I3=imnoise(I1,'gaussian',0,0.02);

for I=1:3
    subplot(3,1,I);
    imshow(eval(strcat('I',int2str(I))));
end

for I=2:3
    figure
    Median_Filter(I1,eval(strcat('I',int2str(I))),3,3,1,1);
    Median_Filter(I1,eval(strcat('I',int2str(I))),5,3,1,2);
    Median_Filter(I1,eval(strcat('I',int2str(I))),7,3,1,3);
    figure;
    Mean_Filter(I1,eval(strcat('I',int2str(I))),3,3,1,1);
    Mean_Filter(I1,eval(strcat('I',int2str(I))),5,3,1,2);
    Mean_Filter(I1,eval(strcat('I',int2str(I))),7,3,1,3);
    figure;
    Gaussian_Filter(I1,eval(strcat('I',int2str(I))),5,0.3,3,1,1);
    Gaussian_Filter(I1,eval(strcat('I',int2str(I))),5,0.6,3,1,2);
    Gaussian_Filter(I1,eval(strcat('I',int2str(I))),5,0.9,3,1,3);
end
