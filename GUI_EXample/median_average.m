function [g]=median_average(f)
% median and averaging filter
[m,n]=size(f);
f=im2double(f);      %convert the data type of the image into double
g=zeros(m,n);        %initialization the image matrix to zeros
p=1;
for i=2:m-1
    for j=2:n-1
    m=f(i-p:i+p,j-p:j+p);
    g(i,j)=median(median(m));  %computer the median for the entire 3x3 matrix each time
    end
end 
g=im2uint8(g);               %convert the type of the image data to integer
end