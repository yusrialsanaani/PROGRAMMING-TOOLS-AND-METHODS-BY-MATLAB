function g=average_filter(w,f)
% average_filter function used for intensity enhancement of the image using
% average filter techneque , the result of the the ehancement will be
% smother image
% f= the input (the image required to enhance)
% w= the filter mask
% g= the output image after enhancement. 
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