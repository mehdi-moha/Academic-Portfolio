clc;
clear;
close all;

flag=0;
external_counter=0;
internal_counter=0;
r = 11;
c = 11;
m_i=imread('circle.bmp');
m_j=imread('square.bmp');
m_k=imread('triangle.bmp');
m_i_new=(~m_i+(-1))+(~m_i);
m_j_new=(~m_j+(-1))+(~m_j);
m_k_new=(~m_k+(-1))+(~m_k);
v_i = transpose(m_i_new(:));
v_j = transpose(m_j_new(:));
v_k = transpose(m_k_new(:));
output=zeros(r,c);
w=zeros(r*c,r*c);
x1=zeros(r*c,1);

for i= 1:r*c
    for j= i:r*c
        if i==j
            w(i,j)=0;
        else
            w(i,j)=v_i(i)*v_i(j)+v_j(i)*v_j(j)+v_k(i)*v_k(j);
            w(j,i)=w(i,j);
        end
    end
end

m_test=imread('circle_noisy.bmp');
m_test_new=(~m_test+(-1))+(~m_test);
x0 = m_test_new(:);

while external_counter~=1000 && flag~=1
    external_counter=external_counter+1;
    y0=w*x0;
    for l= 1:r*c
        if y0(l,1) < 0
            x1(l,1)=-1;
        elseif y0(l,1) > 0
            x1(l,1)=1;
        else
            x1(l,1)= x0(l,1);
        end
    end
    temp=transpose(x1);
    output(:)=temp;
    output=((output+2).*(output-1))./-2;
    if all(temp==v_i) || all(temp==v_j) || all(temp==v_k)
        internal_counter=internal_counter+1;
        if internal_counter==4
            imshow(output);
            disp('Number Of Iteration :');
            disp(external_counter);
            flag=1;
        end
    else
        disp('Number Of Iteration :');
        disp(external_counter);
        disp('Failed Recognition Test');
        internal_counter=0;
        imshow(output);
    end
    x0=x1;
end