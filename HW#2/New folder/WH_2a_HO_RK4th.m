%function Main
%   PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#2 :Done by Yusri Al-Sanaani
%   This program consists of 2 parts :
clear all
close all
clc
fprintf('       PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS\n')
fprintf('       HW#2 :Done by Yusri Al-Sanaani\n')
fprintf('       ................................................\n')

h=0.1;                       % Step size
a=0; b=4;                    % The left & right ends of the interval
t=a:h:b;                     % Interval over which the integration is performed 
to=[0,0] ; xo=[pi;0;-pi/6;0;-pi/6;0];            % initial conditions
y=RK4th2(@f,a,b,h,to,xo);   % Numerical Solution 
%% position
y1=y(:,1);
y2=y(:,3);
y3=y(:,5);
%% velocity
v1=y(:,2);
v2=y(:,4);
v3=y(:,6);
%@f used  to pass f (the function of the ODE )as a function handle to RK4th2 function
%OUT=y; 
%fprintf('                        First part \n')
%fprintf('      Solution of ddy/dx+dy/dx-2y=0 using RK4th method\n')
%fprintf('      ---------------------------------------------------------------------\n')
%fprintf('      | Exact Sol.|   | Num Sol. |   |(Exact-Num.)|   |(Exact-Num.)./Exact|\n')
%fprintf('      ---------------------------------------------------------------------\n')
%fprintf('      | %2.6f  |   | %2.6f |   | %2.6f   |   |     %2.6f      |\n',OUT')
%fprintf('      ---------------------------------------------------------------------\n')
% plotting the numerical solution and the exact solution
% subplot(1,2,1);
plot(t,y1,'g',t,y2,'*b',t,y3,'r','LineWidth',2),legend('\theta','\phi_1','\phi_2')
xlabel('x'),ylabel('y'), title('Solution of ddy/dx+dy/dx-2y=0 using RK4th method')
axis tight
grid
figure
plot(t,v1,'g',t,v2,'*r',t,v3,'b','LineWidth',2),legend('\omega_\theta','\omega_\phi_1','\omega_\phi_2')
grid on
%if v1==v2
    T=a:h:b;

for i=1:length(v1)
    if v1(i,:)==v2(i,:)
        disp(v1(i,:))
    end
end
%end