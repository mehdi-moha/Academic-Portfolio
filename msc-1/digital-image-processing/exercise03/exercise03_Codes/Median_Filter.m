function Median_Filter(I,NI,SoW,X,Y,Z)
L=medfilt2(NI,[SoW SoW]);
subplot(X,Y,Z);
imshow(L);
title(strcat('Median Filter (',int2str(SoW),'*',int2str(SoW),'),','PSNR=',num2str(PSNR(I,L))));
end