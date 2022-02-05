%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#5 PART 1:Done by Yusri Al-Sanaani
%   this programe ussed to solve elliptic heat equation with
%   flux BC using finite difference method
%%
clear all ; close all ;clc
%% 
dx=0.1; x=0:dx:3; dy=dx; y=0:dx:2;                                                        
T=zeros(length(x)+1,length(y)+1);
Told=T;
tol=1e-6; error=1;
%%
while error>tol;
%% first plate
for j=2:21;
    for i=2:10;
        T(i,j)=1/4*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1));
        %T(i,1)=0.5*(T(i+1,1)+T(i-1,1));
        T(i,3)=T(i,1);
        T(i,21)=0;
    end
        T(3,j)=T(1,j);
        T(10,11:21)=100;
end
%% the second plate
for j=2:10;
    for i=11:31;
        T(i,j)=1/4*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1));
        T(12,1)=T(10,1);
        T(11,10)=100;
        T(31,10)=0;
        %T(i,1)=0.5*(T(i+1,1)+T(i-1,1));
        %T(i,3)=T(i,1);
    end
end

%%
TTold=Told(2:end,2:end);                % T before be updated
TT=T(2:end,2:end);                      % Updated T
E=TT-TTold;
error=sqrt(sum(sum(E.^2)));             % Error calculation                          
Told(2:end,2:end)=TT; 
surf(y,x,TT),title('Heat Elliptic Difusion  with Flux BCs'),xlabel('Y'),ylabel('X'),zlabel('T')
end
%% plotting
surf(y,x,TT),title('Heat Elliptic Difusion  with Flux BCs'),xlabel('Y'),ylabel('X'),zlabel('T')