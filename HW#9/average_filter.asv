function g=average_filter(f,w)
% average_filter function used for intensity enhancement of the image using
% average filter techneque , the result of the the ehancement will be
% smother image
% f= the input (the image required to enhance)
% w= the filter mask
% g= the output image after enhancement.
%The output (response) of a smoothing, linear spatial filter is simply the average
%of the pixels contained in the neighborhood of the filter mask. These filters
%sometimes are called averaging filters. they
%also are referred to a lowpass filters.
%The idea behind smoothing filters is straightforward. By replacing the value
%of every pixel in an image by the average of the gray levels in the neighborhood
%defined by the filter mask, this process results in an image with reduced
%“sharp” transitions in gray levels.
% so averaging filters have the undesirable side effect that they blur edges.

[m,n]=size(f);
f=im2double(f);     % convert the data type of the image into double
[p,v]=size(w);
g=zeros(m,n);
p=(p-1)/2;          % exculde the boundary of the image
for i=(p+1):(m-p)
   for j=(p+1):(n-p)
    g(i,j)=sum(sum(w.*f(i-p:i+p,j-p:j+p)));
   end
end
g=g./(sum(sum(w)));  % averging the whole image matrix
g=im2uint8(g);      % convert the type of the image data to integer
end