%% Contrast Stretching by using threshold function.
close all; clear all;clc
x=input('Enter Contrast Factor: '); 
a=imread('I1.tif'); 
[m,n]=size(a); 
for i=1:1:m 
    for j=1:1:n 
        if(a(i,j)<50) 
            b(i,j)=a(i,j);%slope of transfer function between i/p and o/p is 1 
        elseif (a(i,j)>200)
            b(i,j)=a(i,j); 
        else b(i,j)=a(i,j)*x;%slope of transfer function between i/p and o/p is x.Hence contrast of some particular pixel value range increased 
        end
    end
end
subplot(1,2,1),imshow(a),title('Original Image'); 
subplot(1,2,2),imshow(b),title('Contrast Stretching by thresholding')
xlabel(sprintf('Contrast increased by a factor of %g in the range 50 to 200',x))
