function [g]=power_transformation(f,c,gama)
% power transforamtion is a function used for enhancement  an image using
% power technique.
%       f= theinput image required to enhance
%       c= constant multiplier of the power law
%       gama= the power parameter
%       g= the output image after enhancement.
%% Power Law Transformation  
% Expression for power law transformation is given by: s = c *(r ? )
% s is the output pixels value. r is the input pixel value. 
% c and ? are real numbers.
% For various values of ? different levels of enhancements can be obtained.

%The difference between the log-transformation  and the power-law 
% is that using the power-law function a family of possible 
% transformation curves can be obtained just by varying the ? .
[m,n]=size(f);
f=im2double(f); % convert the data type of the image into double
g=zeros(m,n);
for i=1:m
    for j=1:n
        g(i,j)=c*(f(i,j))^gama;
    end
end
 g=im2uint8(g); % convert the type of the image data to integer
end