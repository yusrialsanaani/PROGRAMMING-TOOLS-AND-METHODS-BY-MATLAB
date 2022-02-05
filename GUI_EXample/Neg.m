
clc;clear all
[uFileName,uPathName] = uigetfile('*.*','Select an image'); % Get an image
f=imread(uFileName);
%f=imread('I1.tif');
g=negative(f);
figure
subplot(1,2,1),imshow(f),title('Original image')
subplot(1,2,2),imshow(g),title('Negative image')