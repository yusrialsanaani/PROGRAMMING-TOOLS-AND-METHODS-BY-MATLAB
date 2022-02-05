function [g]=laplacian(f,w)
[m,n]=size(f);
f=im2double(f);           %convert the data type of the image into double 
[p,v]=size(w);
g=zeros(m,n);
g1=zeros(m,n);
p=(p-1)/2;                %exculde the boundary of the image 
for i=p+1:m-p
    for j=p+1:n-p
        g(i,j)=sum(sum(w.*f(i-p:i+p,j-p:j+p)));
    end
end
g=im2uint8(g);       %convert the type of the image data to integer
end