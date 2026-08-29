function Histogram(X,Y,Z)
figure;
HR=imhist(X);
HG=imhist(Y);
HB=imhist(Z);
subplot(1,3,1);
bar(HR,'r');
subplot(1,3,2);
bar(HG,'g');
subplot(1,3,3);
bar(HB,'b');
end