%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#6 :Done by Yusri Al-Sanaani
clc;clear all;close all

x=[0.39;0.78;-0.37;-0.55;0.12;0.77;0.99;0.13;-0.93;-0.27;-0.96;-0.35;0.5;0.37;0.66];
y=[-0.48;-1.91;-0.2;0.18;-1.25;-0.17;0.83;-1.82;1.54;1.87;0.19;-1.61;-1.23;-1.33;1.02];
f=[7.87;18.36;2.94;12.43;14.30;9.76;20.26;13.83;14.81;22.76;5.82;6.41;18.63;15.10;14.30];
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=[ones(15,1),y,x,x.^2,x.*y,y.^2,(x.^2).*(y.^2)];
%A=[ones(15,1),x,y,x.^2,x.*y,y.^2,yyy];
%A=[ones(15,1),x,y,x.^2,x.*y,y.^2];

b=f; 
%%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[U,S,V]=svd(A);         %   decompose A into U,S,&V
AA=U*S*V';              %   show that A=USV'
[m,n]=size(A);          %   [m,n]=[2,3],since m<n, so p=m
Vp=V;
Sp=S(1:n,1:n);
Up=U(:,1:n);
Ap=Vp*inv(Sp)*Up';    %  evaluate A+
X=Ap*b ;            %  Solution of underconstrained system by SVD
fprintf('-----------------------------------------------------------\n')
%b=[X(1) X(2) X(3) X(4) X(5) X(6)];
b=[X(1) X(2) X(3) X(4) X(5) X(6) X(7)];
fprintf('       a1        a2        a3       a4       a5        a6       a7  \n')
disp(b)
fprintf('-----------------------------------------------------------\n')
fprintf('-----------------------------------------------------------\n')
xp=pinv(A)*f;
b=[xp(1) xp(2) xp(3) xp(4) xp(5) xp(6) xp(7)];
%b=[xp(1) xp(2) xp(3) xp(4) xp(5) xp(6)];
fprintf('       a1        a2        a3       a4       a5        a6       a7  \n')
disp(b)
fprintf('-----------------------------------------------------------\n')
