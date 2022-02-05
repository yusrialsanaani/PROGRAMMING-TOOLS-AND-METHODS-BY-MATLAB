%% The log transformation
clear all;clc
[uFileName,uPathName] = uigetfile('*.*','Select an image'); % Get an image
f=imread(uFileName);
%f=imread('I1.tif');
x=inputdlg('Enter Vlue of C:');
c=str2num(x{:});
g=log_tr(c,f);
figure
subplot(1,2,1),imshow(f),title('Original image')
subplot(1,2,2),imshow(g),title('image with log transformation ')
