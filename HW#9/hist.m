% program to increase the contrast of an image by histogram equivalent
close all; clear all;clc
a=imread('I1.tif');
imshow(a)
b=histeq(a); 
subplot(2,2,1),subimage(a),title('Original Image'); 
subplot(2,2,2),subimage(b),title('contrast Image')
xlabel('Contrast increased by Histogram'); 
subplot(2,2,3),imhist(a),title('Histogram of Original Image'); 
subplot(2,2,4),imhist(b),title('Histogram of Contrast Image'); 
