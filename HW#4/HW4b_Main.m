%function Main 
%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#4 part 2 :Done by Yusri Al-Sanaani
%   This program used to solve Elliptical PDE of heat distribution in a
%   sphere using FD method
%%
clear all;close all;clc
%% Initializations
N=20; dr=1/N; dth=2*pi/20; r=0:dr:1; 
th=0:dth:(2*pi+(dth));               % creating imaginary node at theta = 2*pi+dth
TOL=1e-6; error=1;
%% Defining a Dynamic Matrix
U=[ ]; 
%% Initialization of Circumference BC
U(N+1,:)=100*sin(th);
%% Initialization of internal BCs by assumption
U(1,:)=0;                         % U(0,2*pi)
U(2:end-1,1)=0;                  % U(r,0)
U(2:end-1,end)=0;                 % U(r,2*pi)
%%
while error>TOL
for i=2:N
    for j=2:length(th)-1
        A=(r(i)*dr*(dth^2)+2*(r(i)^2)*(dth^2))/(4*(r(i)^2)*(dth^2)+4*(dr^2));
        B=(2*(r(i)^2)*(dth^2)-r(i)*dr*(dth^2))/(4*(r(i)^2)*(dth^2)+4*(dr^2));
        C=(dr^2)/(2*(r(i)^2)*(dth^2)+2*(dr^2));
        U_new(i,j)=A*U(i+1,j)+B*U(i-1,j)+C*(U(i,j+1)+U(i,j-1));
    end
end

%% error updating 
E=U(2:end-1,2:end-1)-U_new(2:end,2:end);
error=sqrt(sum(sum(E.^2)));
U(2:end-1,2:end-1)=U_new(2:end,2:end);
end
%% plotting
theta=th(1:end-1); UU=U(:,1:end-1); % excluding imaginary points 
surf(theta,r,UU),xlabel('Theta'),ylabel('r'),zlabel('Temperature'),title('Sphere Temperature Profile')
%end