%% laplacian filter
[uFileName,uPathName] = uigetfile('*.*','Select an image'); % Get an image
f=imread(uFileName);
%f=imread('I11.jpg'); 
w=[1 1 1;1 -8 1;1 1 1];   %laplacian mask
g=laplacian(f,w);
figure
subplot(1,2,1),imshow(f), title('Original image')
subplot(1,2,2),imshow(g), title('Laplacian image')