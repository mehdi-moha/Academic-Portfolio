function Mean_Filter(I,NI,SoW,X,Y,Z)
W=ones(SoW)/(SoW*SoW);
L=imfilter(NI,W);
subplot(X,Y,Z);
imshow(L);
title(strcat('Mean Filter (',int2str(SoW),'*',int2str(SoW),'),','PSNR=',num2str(PSNR(I,L))));
end