%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#5 :Done by Yusri Al-Sanaani
%   This program used to solve PDE-heat equation using ADI method.  
close all; clear all ;clc
%% initalizations 
dx=1/30; dy=1/30; dt=.01;        % step size in (X,Y)direction & time                   
x=0:dx:1; y=0:dy:1; t=0:dt:1;    % x,y,&time vectors
nx=length(x); ny=length(y); l=length(t);
%% TRIGONAL MATRIX TO FIND A1 of first left hand side 
alpha=1;
a1=((2/dt)+((2*alpha)/(dy^2))); a2=(-1*alpha)/(dy^2);
b1=((2/dt)-((2*alpha)/(dx^2)));
A1=diag((a1*ones(nx,1)))+diag(a2*ones(nx-1,1),1)+diag(a2*ones(nx-1,1),-1);
A1(1,1:3)=[1 0 0];A1(end,end-2:end)=[0 0 1];
%% TRIGONAL MATRIX TO FIND A2 of second left hand side
a3=((2/dt)+((2*alpha)/(dx^2))); a4=(-1*alpha)/(dx^2);
b2=((2/dt)-((2*alpha)/(dy^2)));
A2=diag((a3*ones(ny,1)))+diag(a4*ones(ny-1,1),1)+diag(a4*ones(ny-1,1),-1);
A2(1,1:3)=[1 0 0];A2(end,end-2:end)=[0 0 1];
%% 
T=zeros(nx,ny,l);              % Temperature matrix
for w=1:l
    T(end,:,w)=zeros(1,nx);    % BC in X-direction
    T(:,end,w)=sin(pi*x);      % BC in Y-direction
end
Thalf=T;                       % inititation of half-time step matrix
Tfull=T;                       % inititation of full-time step matrix
%% looping through all times
for k=2:l    
    for i=2:nx-1               % looping through each raw 
        F11=-a4*T(i-1,:,k-1)+b1*T(i,:,k-1)-a4*T(i+1,:,k-1);  % Updats F1 matrix from Equ.#1      
        F1=F11';
        F1(1,1)=0; F1(end,1)=sin(pi*x(i));
        Ty=A1\F1;            
        Thalf(i,:,k)=Ty;       % sol. for all lines is ready in Thalf matrix
    end
    for j=2:ny-1               % looping through each column
        F2=-a2*Thalf(:,j-1,k)+b2*Thalf(:,j,k)-a2*Thalf(:,j+1,k);% Updats F2 matrix from Equ.#2
        F2(1,1)=0;F2(end,1)=0;
        Tx=A2\F2;        
        Tfull(:,j,k)=Tx;       % sol. for all lines is ready in Tfull matrix      
    end
    T(:,:,k)=Tfull(:,:,k);     % Temperaturein full-time matrix  
end
for j=2:5:l;
surf(x,y,T(:,:,j)');axis([0 1 0 1 0 1]);
xlabel('X'),ylabel('Y'),zlabel('Temperature'),title('Temperature Profile')
pause(0.2)
end

