clear all;clc
[uFileName,uPathName] = uigetfile('*.*','Select an image'); % Get an image
f=imread(uFileName);
x=inputdlg('Enter Value of C :');
c= str2num(x{:}); 
x1=inputdlg('Enter Value of Gamma :');
gama=str2num(x1{:}); 
g1=power_transformation(f,c,gama);
figure 
subplot(1,2,1),imshow(f), title('Original image')
subplot(1,2,2),imshow(g1), title('power transformation with gamma=0.6')
