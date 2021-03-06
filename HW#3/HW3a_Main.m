function Main 
%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%  HW#3 :Done by Yusri Al-Sanaani
%  This program used to solve Parabolic PDE with
%  derivative boundary conditions using explicit finite difference Method.
% forward F.D for 1st PDE U'(i,j)/x'=[U(i+1,j)-U(i,j)]/dx
% backward U'(i,j)/x'=[U(i,j)-U(i-1,j)]/dx
% centered U'(i,j)/x'=[U(i+1,j)-U(i-1,j)]/2dx
% centered U"(i,j)/x"=[U(i+1,j)-2U(i,j)+U(i-1,j)]/(dx)^2 for 2nd PDE
% for stability alpha*dt/dx^2<=0.5
% [T(j+1,i)-T(j,i)]/dt=[T(j,i+1)-2T(j,i)+T(j,i-1)]/dx^2
clc
clear all
close all
dt=0.0025; 
dx=0.1;
alpha=1; 
t(1)=0;
L=(alpha*dt)/(dx)^2;
x=0:dx:1;
n=length(x);
Tol=1e-6;
error=1;
j=1;
T=zeros(1,n+2);
while error>Tol
    for i=2:n+1
        T(j+1,i)=(1-2*L)*T(j,i)+L*T(j,i+1)+L*T(j,i-1)+dt*100*sin(pi*x(i-1)); 
    end
    T(j+1,1)=T(j+1,3)-2*dx*T(j+1,2)+20*dx; % [T(j+1,3)-T(j+1,1)]/2dx=T(j,2)-10
    T(j+1,n+2)=T(j+1,n)-2*dx*T(j+1,n+1)+20*dx;% [T(j+1,N+2)-T(j+1,N)]/2dx=-T(j,N+1)+10
    t(j+1)=t(j)+dt;
    error=sum(abs((T(j+1,:)-T(j,:)))); % error calculations
    j=j+1;
end
nB=length(t);
TEMP=T(1:end,2:end-1);   % exclude the imaginary points from the boundaries 
mesh(x,t,TEMP),xlabel('X'),ylabel('Time'),zlabel('Temperature')
title('Parabolic Temperature Profile')
%TEMP=TEMP(1:100:end,1:end) ;% for each 0.25 second , display one row 
                           % in other word ,displaying one row every 100 rows
TEMP(2800,6) %TEMP @ X=0.6 & T=7 
end
