%% Contrast Stretching By Multiplication of each pixel with a scalar. 
clear all;clc
[uFileName,uPathName] = uigetfile('*.*','Select an image'); % Get an image
a=imread(uFileName);
x=inputdlg('Enter Contrast Factor:');
x= str2num(x{:}); 
%x=2; %input('Enter Contrast Factor: '); 
%a=imread('I1.tif'); 
[m,n]=size(a); 
for i=1:1:m 
    for j=1:1:n 
        b(i,j)=a(i,j)*x; 
    end
end
figure
subplot(1,2,1),subimage(a),title('Original Image')
subplot(1,2,2),subimage(b),title('contrast Image')
xlabel(sprintf('Contrast Stretching By Multiplication of each pixel by %g ',x))