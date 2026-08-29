clc;
clear;
close all;

output=zeros(11,11);

N0=~imread('0.bmp');
N0=(N0==0)+(N0==1)*-1;

N1=~imread('1.bmp');
N1=(N1==0)+(N1==1)*-1;

N2=~imread('2.bmp');
N2=(N2==0)+(N2==1)*-1;

N3=~imread('3.bmp');
N3=(N3==0)+(N3==1)*-1;

N4=~imread('4.bmp');
N4=(N4==0)+(N4==1)*-1;

N5=~imread('5.bmp');
N5=(N5==0)+(N5==1)*-1;

N6=~imread('6.bmp');
N6=(N6==0)+(N6==1)*-1;

N7=~imread('7.bmp');
N7=(N7==0)+(N7==1)*-1;

N8=~imread('8.bmp');
N8=(N8==0)+(N8==1)*-1;

N9=~imread('9.bmp');
N9=(N9==0)+(N9==1)*-1;

T=cat(2,N0(:),N1(:),N2(:),N3(:),N4(:),N5(:),N6(:),N7(:),N8(:),N9(:));
net = newhop(T);

pause on;
for d=0.01:0.02:0.45
    Noisy_N0=imnoise(N0,'salt & pepper',d);
    Noisy_N1=imnoise(N1,'salt & pepper',d);
    Noisy_N2=imnoise(N2,'salt & pepper',d);
    Noisy_N3=imnoise(N3,'salt & pepper',d);
    Noisy_N4=imnoise(N4,'salt & pepper',d);
    Noisy_N5=imnoise(N5,'salt & pepper',d);
    Noisy_N6=imnoise(N6,'salt & pepper',d);
    Noisy_N7=imnoise(N7,'salt & pepper',d);
    Noisy_N8=imnoise(N8,'salt & pepper',d);
    Noisy_N9=imnoise(N9,'salt & pepper',d);
    for i=0:9
        Ai = {eval(strcat('Noisy_N',int2str(i),'(:)'))};
        [Y,~,~] = sim(net,{1 59},{},Ai);
        Y=cell2mat(Y);
        N=size(Y,2);
        figure;
        output(:)=Ai{1};
        subplot(6,10,1);
        imshow(output);
        title(strcat('d=',num2str(d)));
        for j=1:N
            output(:)=Y(:,j);
            subplot(6,10,j+1);
            imshow(output);
            title(strcat('#',int2str(j)));
            if Y(:,j) == N0(:)
                break;
            elseif Y(:,j) == N1(:)
                break
            elseif Y(:,j) == N2(:)
                break
            elseif Y(:,j) == N3(:)
                break
            elseif Y(:,j) == N4(:)
                break
            elseif Y(:,j) == N5(:)
                break
            elseif Y(:,j) == N6(:)
                break
            elseif Y(:,j) == N7(:)
                break
            elseif Y(:,j) == N8(:)
                break
            elseif Y(:,j) == N9(:)
                break
            else
            end
        end
    end
    display('press any key to continue...');
    pause;
    close all;
end