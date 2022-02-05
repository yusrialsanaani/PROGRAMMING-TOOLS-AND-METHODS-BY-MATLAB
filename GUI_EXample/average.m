%% average filter
clear all;clc
[uFileName,uPathName] = uigetfile('*.*','Select an image'); % Get an image
f=imread(uFileName);
x=inputdlg('Enter Mask Size :');
x= str2num(x{:}); 
%f=imread('I7.tif');
% mask of 3x3 , 5x5, 9x9,15x15, and 35x35 
w=ones(x,x);

%calling average filter
g1=average_filter(w,f);

figure
subplot(1,2,1),imshow(f) , title('Original image')
subplot(1,2,2),imshow(g1), title('averaging filter')
 xlabel(sprintf('averaging filter with mask of %g*%g',x))
 % average
