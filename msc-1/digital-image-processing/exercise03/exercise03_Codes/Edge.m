function Edge(G)
[m,n]=size(G);
G=abs(G);
temp=false(m,n);
for i=2:m-1;
    for j=2:n-1;
        if G(i,j)>=0.85*(max(max(G)));
            temp(i,j)=1;
        else
            temp(i,j)=0;
        end
    end
end
imshow(bwmorph(temp,'skel',inf));
end