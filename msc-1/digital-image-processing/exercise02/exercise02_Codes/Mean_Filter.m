function Mean_Filter(NI,SoW,X,Y,Z)
W=ones(SoW)/(SoW*SoW);
L=imfilter(NI,W);
subplot(X,Y,Z);
imshow(L);
title(strcat('Mean Filter (',int2str(SoW),'*',int2str(SoW),')'));
end