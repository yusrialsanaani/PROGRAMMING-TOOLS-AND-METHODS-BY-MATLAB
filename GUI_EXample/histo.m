% program to increase the contrast of an image by histogram equivalent
 clear all;clc
 [uFileName,uPathName] = uigetfile('*.*','Select an image'); % Get an image
a=imread(uFileName);
%a=imread('I1.tif');
b=histeq(a); 
figure
subplot(2,2,1),imshow(a),title('Original Image'); 
subplot(2,2,2),imshow(b),title('contrast Image');xlabel('Contrast increased by Histogram'); 
subplot(2,2,3),imhist(a),title('Histogram of Original Image'); 
subplot(2,2,4),imhist(b),title('Histogram of Contrast Image'); 
