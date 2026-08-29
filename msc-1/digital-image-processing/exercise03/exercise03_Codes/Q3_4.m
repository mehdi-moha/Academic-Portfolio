clc;
clear;
close all;

I=imread('ART2.gif');

F1=[-1 -2 -1;0 0 0;1 2 1];
F2=[-1 0 1;-2 0 2;-1 0 1];
F3=[2 1 0;1 0 -1;0 -1 -2];
F4=[0 1 2;-1 0 1;-2 -1 0];
for J=1:4
    figure;
    subplot(1,3,1);
    imshow(I,[]);
    G=imfilter(I,eval(strcat('F',int2str(J))),'replicate');
    subplot(1,3,2);
    imshow(G,[]);
    subplot(1,3,3);
    Edge(G);
end
