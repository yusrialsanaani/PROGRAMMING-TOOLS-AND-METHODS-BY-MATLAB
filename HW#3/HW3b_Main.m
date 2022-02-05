%function Main 
%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%  HW#4 :Done by Yusri Al-Sanaani
%  This program used to solve Parabolic PDE with
%  derivative boundary conditions using implicit finite difference Method.
% [T(j+1,i)-T(j,i)]/dt=[T(j+1,i+1)-2T(j+1,i)+T(j+1,i-1)]/dx^2
clc
clear all
close all
dt=0.0025; 
dx=0.1;
alpha=1; 
L=(dt)/(dx)^2;
x=0:dx:1;
t=0:dt:10;
n=length(x);
m=length(t);
%construction of the tridigonal matrix A
A1=diag((1+2*L)*ones(n+2,1))+diag(-L*ones(n+1,1),1)+diag(-L*ones(n+1,1),-1);
A2=A1(2:end-1,:);
A=[1 2*dx -1 zeros(1,n-1); A2; zeros(1,n-1) -1 2*dx 1];
f=zeros(n+2,1);     % Right hand side of the system AT=F   
for j=1:m
T1=A\f;
f=[20*dx; T1(2:end-1)+dt*100*sin(pi*x)'; 20*dx]; 
T(j,:)=T1;
end
TEMP=T(1:end,2:end-1);   % excluding the imaginary points from the boundaries
mesh(x,t,TEMP),xlabel('X'),ylabel('Time'),zlabel('Temperature')
title('Parabolic Temperature Profile')
%TEMP=TEMP(1:1000:end,1:end) ; % for each 0.25 second , display one row
                           % in other word ,displaying one row every 100 rows
                           %size(TEMP)
T=round(TEMP(:,:));
for j=1:11
    for i=1:40%01
        if T(i,j)==0
            fprintf('---------------------------\n')
            fprintf('|   i    |   j     |\n')
            fprintf('---------------------------\n')
            fprintf('|  %1.0f     |     %1.0f   |\n',i,j)

        end
    end
end
                                  
                              
                          
                      
%fprintf('---------------------------------------------------------------------------------------------------------------\n')
%fprintf('                                                       X                                                       \n')
%fprintf('                                                     center                                                    \n')
%fprintf('---------------------------------------------------------------------------------------------------------------\n')
%fprintf('|   x1    |   x2    |   x3    |   x4    |  x5     |  x6     |   x7    |   x8    |   x9    |   x10   |    x11  |\n')
%fprintf('---------------------------------------------------------------------------------------------------------------\n')
%fprintf('| %7.4f | %7.4f | %7.4f | %7.4f | %7.4f | %7.4f | %7.4f | %7.4f | %7.4f | %7.4f | %7.4f |\n',TEMP')
%fprintf('---------------------------------------------------------------------------------------------------------------\n')
%end