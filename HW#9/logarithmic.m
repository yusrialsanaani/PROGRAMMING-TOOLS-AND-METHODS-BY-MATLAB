clc; clear all; close all;
f=imread('I1.tif');
g=im2double(f);           %convert the data type of the image into double 
%g=rgb2gray(f);
c=input('Enter the constant value, c = ');
[M,N]=size(g);
        for x = 1:M
            for y = 1:N
                %m=double(g(x,y));
                z(x,y)=c*log(1+g(M,N)); 
            end
        end
imshow(f), figure, imshow(z);
