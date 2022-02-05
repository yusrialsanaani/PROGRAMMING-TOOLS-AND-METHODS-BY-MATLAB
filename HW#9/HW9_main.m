%%   PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%%   HW#9 :Done by Yusri Al-Sanaani
%%   Image Processing
clc
clear all
close all
%% negative image
f=imread('I1.tif');
[m,n]=size(f);
k=8;                % number of the bits present in the image
L=2^k;              % number of gray level of the image 
for i=1:m
    for j=1:n
        g(i,j)=(L-1)-f(i,j);
    end
end
figure,
subplot(1,2,1),imshow(f),title('original image')
subplot(1,2,2),imshow(g),title('negative image')
%% laplacian filter
f=imread('I11.jpg');
[m,n]=size(f);
f=im2double(f);           %convert the data type of the image into double 
w=[1 1 1;1 -8 1;1 1 1];   %laplacian mask
w1=[0 1 0;1 -4 1;0 1 0];  %laplacian mask
[p,v]=size(w);
g=zeros(m,n);
g1=zeros(m,n);
p=(p-1)/2;                %exculde the boundary of the image 
for i=p+1:m-p
    for j=p+1:n-p
        g(i,j)=sum(sum(w.*f(i-p:i+p,j-p:j+p)));
        g1(i,j)=sum(sum(w1.*f(i-p:i+p,j-p:j+p)));
    end
end
g=im2uint8(g);       %convert the type of the image data to integer
g2=im2uint8(g1);     %convert the type of the image data to integer
figure
subplot(1,3,1),imshow(f),title('original image')
subplot(1,3,2),imshow(g),title('Laplacian image')
subplot(1,3,3),imshow(g1),title('Laplacian image')
%% power transformation
% calling power function using c=1, and gamma=0.6,0.4,and 0.3.
f=imread('I3.tif');
g1=power_transformation(f,1,0.6);
g2=power_transformation(f,1,0.4);
g3=power_transformation(f,1,0.3);
figure 
subplot(2,2,1),imshow(f), title('orginal image')
subplot(2,2,2),imshow(g1), title('power transformation with gamma=0.6')
subplot(2,2,3),imshow(g2), title('power transformation with gamma=0.4')
subplot(2,2,4),imshow(g3), title('power transformation with gamma=0.3')
f=imread('I4.tif');
%--------------------------------------------------------------------------
%calling power function using c=1, and gamma=3,4and 5.
g1=power_transformation(f,1,3);
g2=power_transformation(f,1,4);
g3=power_transformation(f,1,5);
figure
subplot(2,2,1),imshow(f), title('orginal image')
subplot(2,2,2),imshow(g1), title('power transformation with gamma=3')
subplot(2,2,3),imshow(g2), title('power transformation with gamma=4')
subplot(2,2,4),imshow(g3), title('power transformation with gamma=5')
%% average filter
f=imread('I7.tif');
%%% mask of 3x3 , 5x5, 9x9,15x15, and 35x35 
w1=ones(3,3);
w2=ones(5,5);
w3=ones(9,9);
w4=ones(15,15);
w5=ones(35,35);
%%% apply the average filter
g1=average_filter(f,w1);
g2=average_filter(f,w2);
g3=average_filter(f,w3);
g4=average_filter(f,w4);
g5=average_filter(f,w5);
%%% show the image after enhancement
figure
subplot(2,3,1),imshow(f), title('orginal image')
subplot(2,3,2),imshow(g1), title('3x3 averaging filter')
subplot(2,3,3),imshow(g2), title('5x5 averaging filter')
subplot(2,3,4),imshow(g3), title('9x9 averaging filter')
subplot(2,3,5),imshow(g4), title('15x15 averaging filter')
subplot(2,3,6),imshow(g5), title('35x35 averaging filter')
%%median and averaging filter
f=imread('I8.tif');
[m,n]=size(f);
f=im2double(f);          %convert the data type of the image into double
w=ones(3,3);             %mask 3x3 for averaging filter
g=zeros(m,n);            %initialization the image matrix to zeros
p=1;
for i=2:m-1
    for j=2:n-1
    m=f(i-p:i+p,j-p:j+p);
    g(i,j)=median(median(m));  %computer the median for the entire 3x3 matrix each time
    end
end 
g=im2uint8(g);               %convert the type of the image data to integer
y=average_filter(f,w);
figure
subplot(1,3,1),imshow(f), title('Orginal image')
subplot(1,3,2),imshow(y), title('Averaging filter 3x3')
subplot(1,3,3),imshow(g), title('Median filter 3x3')
