%% Power Law Transformation  
% Expression for power law transformation is given by: s = c *(r ? )
% s is the output pixels value. r is the input pixel value. 
% c and ? are real numbers.
% For various values of ? different levels of enhancements can be obtained.

%The difference between the log-transformation  and the power-law 
% is that using the power-law function a family of possible 
% transformation curves can be obtained just by varying the ? .

% original image For c=1 B : ? =3.0 C : ? =4.0 D : ? =5.0 
 % program for image enhancement using power law
A=input('Enter the value of constant A'); 
x=input('Enter the value of power x'); 
a=imread('I1.tif');
[m,n]=size(a);
for i=1:1:m
    for j=1:1:n 
        b(i,j)=A*(a(i,j)^x); 
    end
end
subplot(1,2,1),subimage(a),title('Original Image')
subplot(1,2,2),subimage(b),title('Image after power law transformation')
xlabel(sprintf('Constant is %gnPower is %g',A,x))
