%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#6 :Done by Yusri Al-Sanaani
clc;clear all;close all

x=[0.39;0.78;-0.37;-0.55;0.12;0.77;0.99;0.13;-0.93;-0.27;-0.96;-0.35;0.5;0.37;0.66];
%x=x.x;                
y=[-0.48;-1.91;-0.2;0.18;-1.25;-0.17;0.83;-1.82;1.54;1.87;0.19;-1.61;-1.23;-1.33;1.02];
%y=y.y ;               
f=[7.87;18.36;2.94;12.43;14.30;9.76;20.26;13.83;14.81;22.76;5.82;6.41;18.63;15.10;14.30];
%f=f.f;
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=[ones(15,1),x,y,x.^2,x.*y,y.^2,(x-y).^2];
b=f; 
%%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[U,S,V]=svd(A);         %   decompose A into U,S,&V
%AA=U*S*V';              %   show that A=USV'
%[m,n]=size(A);          %   [m,n]=[2,3],since m<n, so p=m
%Vp=V;
%Sp=S(1:n,1:n);
%Up=U(:,1:n);
%Ap=Vp*inv(Sp)*Up';    %  evaluate A+
%X=Ap*b ;            %  Solution of underconstrained system by SVD
%%  %%%%%%%%%
%X=inv(A'*A)*A'*b;        %  apply Least Square Error equation to fit data
X=(A'*A)\(A'*b); 
T=X(1)+X(2)*x+X(3)*y+X(4)*x.^2+X(5)*x.*y+X(6)*y.^2+X(7)*(x-y).^2;      % fitted result
dx=linspace(-1,1,500);   %  generates n points linearly spaced between 
dy=linspace(-2,2,500); %  generates n points linearly spaced between
[x1,y1]=meshgrid(dx,dy);
T1=X(1)+X(2)*x1+X(3)*y1+X(4)*x1.^2+X(5)*x1.*y1+X(6)*y1.^2+X(7)*(x1-y1).^2;      % fitted result
mesh(y1,x1,T1)
hidden off    % turns off hidden line removal for the current graph.
axis tight;  % setting the axis limits to the range of the data.
hold on      % to retain the current plot and certain axes properties  
             % so that subsequent graphing commands add to the existing graph
plot3(y,x,f,'o','MarkerSize',10,'MarkerFaceColor','r') %Plot lines and points in 3-D space.
stem3(y,x,f,'fill')
hidden off
title('fitting data using least square error')
xlabel('\alpha (rad)'),ylabel('\omega (rad/s)'),zlabel('Torque (Newton*meter)')
legend('Fitted Line','Data Points')
grid on
RMSE = sqrt(mean((f - T).^2));  % Root Mean Squared Error
fprintf('-----------------------------------------------------------\n')
b=[X(1) X(2) X(3) X(4) X(5) X(6) X(7)];
fprintf('       a1        a2        a3       a4       a5        a6       a7  \n')
disp(b)
fprintf('-----------------------------------------------------------\n')
fprintf(' RMSE = %2.5f \n',RMSE)
fprintf('-----------------------------------------------------------\n')
xp=pinv(A)*f;
b=[xp(1) xp(2) xp(3) xp(4) xp(5) xp(6) xp(7)];
fprintf('       a1        a2        a3       a4       a5        a6       a7  \n')
disp(b)
fprintf('-----------------------------------------------------------\n')
