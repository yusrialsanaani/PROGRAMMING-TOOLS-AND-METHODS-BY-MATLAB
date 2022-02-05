%function HW4_Main 
%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#4 part 1:Done by Yusri Al-Sanaani
%   This program used to solve Elliptical PDE of heat distribution in a
%   plate using FD method
%%
clc,clear all,close all
%%  Initializations
N=20; L=1; dx=L/N; dy=L/N; x=0:dx:1; y=0:dy:1; error=1; tol=1e-6;
%%  Initialization of BCs: note that the physical BCs will be inverted when
%   they are represented in the matrix 
T=[ ];
T(:,1)=0;                   % T(y,0)=0   instead of T(0,y)=0
T(:,N+1)=0;                 % T(y,L)=0   instead of T(L,Y)=0
T(1,:)=0;                   % T(0,x)=0   instead of T(x,0)=0
T(N+1,:)=sin(pi*x/L);       % T(L,x)=sin(pi*x/L) instead of T(x,L)=sin(pi*x/L)
%% Updating T
while error>tol
    for j=2:N
        for i=2:N
            T_new(i,j)=0.25*(T(i,j+1)+T(i,j-1)+T(i+1,j)+T(i-1,j));
        end
    end
    E=T_new(2:end,2:end)-T(2:end-1,2:end-1);
    error=sqrt(sum(sum(E.^2)));
    T(2:end-1,2:end-1)=T_new(2:end,2:end);
    surf(x,y,T),xlabel('X'),ylabel('Y'),zlabel('Temperature'),title('Temperature Profile')
    axis([0 1 0 1 0 1.2])
        pause(0.1)
end
%% plotting
%surf(x,y,T),xlabel('X'),ylabel('Y'),zlabel('Temperature'),title('Temperature Profile')
 %   axis([0 1 0 1 0 1.2])
  %      pause(0.1)
%end    
