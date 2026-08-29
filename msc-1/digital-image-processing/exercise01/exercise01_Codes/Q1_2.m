clc;
clear;
close all;

I=0;
figure;
J=imread('barbara.gif');
for K=55:-10:5
    I=I+1;
    imwrite(J,strcat('barbara',int2str(K),'.jpeg'),'Quality',K);
    subplot(2,3,I);
    imshow(strcat('barbara',int2str(K),'.jpeg'));
    title(strcat('Quality=',int2str(K)));
end

for L=55:-10:5
    J = imread(strcat('barbara',int2str(L),'.jpeg'));
    h=imhist(J);
    figure;
    subplot(1,2,1);
    imshow(strcat('barbara',int2str(L),'.jpeg'));
    title(strcat('Quality=',int2str(L)));
    subplot(1,2,2);
    bar(h,'b');
end
