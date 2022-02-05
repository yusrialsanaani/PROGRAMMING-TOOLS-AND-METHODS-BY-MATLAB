function[g]=negative(f)
% this function is useful for enhancing white or gray details embedded in
% dark region , spatitially when dark regions are dominated
% s=(L-1)-r
[m,n]=size(f);
k=8;                % number of the bits present in the image
L=2^k;              % number of gray level of the image 
for i=1:m
    for j=1:n
        g(i,j)=(L-1)-f(i,j);
    end
end
end