function Median_Filter(NI,SoW,X,Y,Z)
L=medfilt2(NI,[SoW SoW]);
subplot(X,Y,Z);
imshow(L);
title(strcat('Median Filter (',int2str(SoW),'*',int2str(SoW),')'));
end