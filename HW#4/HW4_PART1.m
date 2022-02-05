%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#5 PART 1:Done by Yusri Al-Sanaani
%   this programe ussed to solve elliptic heat equation with
%   flux BC using finite difference method
%%
clear all ; close all ;clc
%% 
dx=0.1; x=0:dx:2; dy=dx; y=0:dx:3;                                                        
T=zeros(length(x)+1,length(y)+1);
Told=T;
tol=1e-6; error=1;
%%
while error>tol;
%% first plate
for j=2:31;
    for i=2:5;
        T(i,j)=1/4*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1));
        T(i,1)=0.5*(T(i+1,1)+T(i-1,1));
        T(i,31)=0;
    end
    T(1,j+1)=0.5*(T(1,j+1)+T(1,j-1));
    T(5,11:31)=100;
end
%% the second plate
for j=2:10;
    for i=5:15;
        T(i,j)=1/4*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1));
        T(i,9)=100;
        T(i,1)=0.5*(T(i+1,1)+T(i-1,1));
    end
end
%% the third plate
for j=2:31;
    for i=15:21;
        T(i,j)=1/4*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1));
        T(i,1)=0.5*(T(i+1,1)+T(i-1,1));
        T(i,31)=0; 
    end
    T(21,j)=0;
    T(16,11:31)=100;
end
%%
TTold=Told(2:end,2:end);                % T before be updated
TT=T(2:end,2:end);                      % Updated T
E=TT-TTold;
error=sqrt(sum(sum(E.^2)));             % Error calculation                          
Told(2:end,2:end)=TT; 
end
%% plotting
surf(y,x,TT),title('Heat Elliptic Difusion  with Flux BCs'),xlabel('X'),ylabel('y'),zlabel('T')