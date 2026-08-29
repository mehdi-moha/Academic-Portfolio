function Gaussian_Filter(NI,hsize,sigma,X,Y,Z)
H=fspecial('gaussian',hsize,sigma);
L=imfilter(NI,H,'replicate');
subplot(X,Y,Z);
imshow(L);
title(strcat('Gaussian Filter (',num2str(hsize),',',num2str(sigma),')'));
end