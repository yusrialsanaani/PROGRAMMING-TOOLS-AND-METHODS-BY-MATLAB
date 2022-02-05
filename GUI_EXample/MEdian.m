%% median and averaging filter
clear all;clc
[uFileName,uPathName] = uigetfile('*.*','Select an image'); % Get an image
f=imread(uFileName);
%f=imread('I8.tif');
g=median_average(f);
figure
subplot(1,2,1),imshow(f), title('Orginal image')
subplot(1,2,2),imshow(g), title('Median filter 3x3')