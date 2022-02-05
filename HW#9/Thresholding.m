%% Thresholding Original Image Transformed 
%%  program for image thresholding 
a=imread('I1.tif');
[m,n]=size(a); 
for i=1:1:m 
    for j=1:1:n 
        if(a(i,j)<125) b(i,j)=0;%pixel values below 125 are mapped to zero 
        else b(i,j)=255;%pixel values equal or above 125 are mapped to 255 
        end
    end
end
subplot(1,2,1),subimage(a),title('Original Image'); 
subplot(1,2,2),subimage(b),title('threshold Image');