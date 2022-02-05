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
% The Laplacian operator is an example of a second order or second
% derivative method of enhancement. It is particularly good at finding
% the fine detail in an image. Any feature with a sharp discontinuity 
%(like noise, unfortunately) will be enhanced by a Laplacian operator.
% Thus, one application of a Laplacian operator is to restore fine detail
% to an image which has been smoothed to remove noise. 
% (The median operator is often used to remove noise in an image.)