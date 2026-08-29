clc;
clear;
close all;

K=imread('house.tif');
imshow(K);
title('Original Image');
K=double(K);
[m n]=size(K);
L=256;

% Lecture #6 - Slide #16 %
P1=round(0.3*L);
P2=round(0.6*L);
S1=round(0.3*P1);
S2=round(1.2*P2);
m1=((S1-0)/(P1-0));
m2=((S2-S1)/(P2-P1));
m3=(((L-1)-S2)/((L-1)-P2));
temp=zeros(m,n);
for I=1:m
    for J=1:n
        if K(I,J)<=P1
            temp(I,J)=F(K(I,J),m1,P1,S1);
        elseif K(I,J)>P1 && K(I,J)<=P2
            temp(I,J)=F(K(I,J),m2,P2,S2);
        elseif K(I,J)>P2
            temp(I,J)=F(K(I,J),m3,L-1,L-1);
        end
    end
end
figure;
imshow(uint8(temp));
title('Lecture #6 - Slide #16');
%------------------------%

% Lecture #6 - Slide #17 %
T1=50;
T2=100;
T3=150;
T4=200;
a=50;
b=100;
c=150;
d=200;
temp=zeros(m,n);
for I=1:m
    for J=1:n
        if K(I,J)<T1
            temp(I,J)=0;
        elseif (K(I,J)>=T1 && K(I,J)<T2)
            temp(I,J)=a;
        elseif (K(I,J)>=T2 && K(I,J)<T3)
            temp(I,J)=b;
        elseif (K(I,J)>=T3 && K(I,J)<T4)
            temp(I,J)=c;
        else
            temp(I,J)=d;
        end
    end
end
figure;
imshow(uint8(temp));
title('Lecture #6 - Slide #17');
%------------------------%

% Lecture #6 - Slide #18 %
P1=0;
S1=0;
P2=round(0.8*L);
S2=round(0.6*L);
m1=(S2-S1)/(P2-P1);
temp=zeros(m,n);
for I=1:m
    for J=1:n
        if (K(I,J)>50 && K(I,J)<130)
            temp(I,J)=S2;
        else
            temp(I,J)=F(K(I,J),m1,P1,S1);
        end
    end
end
figure;
imshow(uint8(temp));
title('Lecture #6 - Slide #18');
%------------------------%

% Lecture #6 - Slide #19 %
P1=round(0.2*L);
P2=round(0.5*L);
P3=round(0.9*L);
S1=round(0.07*L);
S2=round(0.35*L);
S3=0;
temp=zeros(m,n);
for I=1:m;
    for J=1:n;
        if (K(I,J)<P1 || (K(I,J)>P2 && K(I,J)<P3))
            temp(I,J)=S1;
        elseif K(I,J)>P3
            temp(I,J)=S3;
        else
            temp(I,J)=S2;
        end
    end
end
figure;
imshow(uint8(temp));
title('Lecture #6 - Slide #19');
%------------------------%
