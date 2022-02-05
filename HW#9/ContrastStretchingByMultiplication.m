%% Contrast Stretching By Multiplication of each pixel with a scalar. 
close all; clear all;clc
x=input('Enter Contrast Factor: '); 
a=imread('I1.tif'); 
[m,n]=size(a); 
for i=1:1:m 
    for j=1:1:n 
        b(i,j)=a(i,j)*x; 
    end
end
subplot(1,2,1),subimage(a),title('Original Image')
subplot(1,2,2),subimage(b),title('contrast Image')
xlabel('Contrast Stretching By Multiplication of each pixel with a scalar')