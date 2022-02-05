function[g]=log_tr(f,c)
% this function is useful for expanding dark pixles in image while compressing the higher 
% gray levels of pixles values
%% The log transformation is given by the expression s = c log(1 + r) 
% where c is a constant and it is assumed that r?0. 
% This transformation maps a narrow range of low- level grey scale 
% intensities into a wider range of output values.
% Similarly maps the wide range of high-level grey scale intensities into
% a narrow range of high level output values
% This transform is used to expand values of dark pixels and compress
% bvalues of bright pixels.
[m,n]=size(f);
f=im2double(f);           %convert the data type of the image into double
%c=3;
for i=1:m
    for j=1:n
        g(i,j)=c*log(1+f(i,j));
    end
end
end