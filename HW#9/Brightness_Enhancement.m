%% program to increase the brightness of an image 
x=input('Enter the factor which brightness should be increased: '); 
a=imread('I5.tif');
%a=rgb2gray(a)
[m,n]=size(a); 
for i=1:1:m 
    for j=1:1:n 
        b(i,j)=a(i,j)*x; 
    end
end
  subplot(1,2,1),subimage(a),title('Original Image')
  subplot(1,2,2),subimage(b),title('Brighter Image')
  xlabel(sprintf('Brightness increased by a factor of %g',x))