%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#6 :Done by Yusri Al-Sanaani
clc;clear all;close all
Te=load('Te.mat');          
Te=Te.Te;
alpha=load('alpha.mat');
alpha=alpha.alpha;
w=load('w.mat');
w=w.w;
A=[w.^2 (w.^2).*(alpha.^2)  w.*alpha];
b=Te;               
%X=inv(A'*A)*A'*b;        %  apply Least Square Error equation to fit data
X=(A'*A)\(A'*b); 
T=X(1)*w.^2+X(2)*(w.^2).*(alpha.^2)+X(3)*w.*alpha;      % fitted result
dw=linspace(230,1531,230);   %  generates n points linearly spaced between 
da=linspace(-16.5,19.6,230); %  generates n points linearly spaced between
[alpha1,w1]=meshgrid(da,dw);
T1=X(1)*w1.^2+X(2)*(w1.^2).*(alpha1.^2)+X(3)*w1.*alpha1; % fit result
mesh(alpha1,w1,T1)
hidden off
axis tight;  % setting the axis limits to the range of the data.
hold on      % to retain the current plot and certain axes properties  
             % so that subsequent graphing commands add to the existing graph
plot3(alpha,w,Te,'o','MarkerSize',10,'MarkerFaceColor','r') %Plot lines and points in 3-D space. 
title('fitting data using least square error')
xlabel('\alpha (rad)'),ylabel('\omega (rad/s)'),zlabel('Torque (Newton*meter)')
legend('Fitted Line','Data Points')
grid on
RMSE = sqrt(mean((Te - T).^2));  % Root Mean Squared Error
fprintf('-----------------------------------------------------------\n')
b=[X(1) X(2) X(3)];
fprintf('     b1          b2          b3  \n')
disp(b)
fprintf('-----------------------------------------------------------\n')
fprintf(' RMSE = %2.5f \n',RMSE)
fprintf('-----------------------------------------------------------\n')
b=Te;               
xp=pinv(A)*b;
b=[X(1) X(2) X(3)];
fprintf('     b1          b2          b3  \n')
disp(b)
fprintf('-----------------------------------------------------------\n')

