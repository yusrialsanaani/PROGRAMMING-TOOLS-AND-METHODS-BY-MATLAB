
%median filter, which, as its name implies, replaces the value of a pixel by the
%median of the gray levels in the neighborhood of that pixel (the original value
%of the pixel is included in the computation of the median). Median filters are
%quite popular because, for certain types of random noise, they provide excellent
%noise-reduction capabilities, with considerably less blurring than linear
%smoothing filters of similar size. Median filters are particularly effective in
%the presence of impulse noise, also called salt-and-pepper noise because of its
%appearance as white and black dots superimposed on an image.
%The image processed with the averaging filter has less visible noise, 
%but the price paid is significant blurring.The superiority in all respects
% of median over average filtering in this case is quite evident. 
% In general, median filtering is much better suited than averaging
% for the removal of additive salt-and-pepper noise.

function [g,y]=median_average(f)
% median and averaging filter
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
end