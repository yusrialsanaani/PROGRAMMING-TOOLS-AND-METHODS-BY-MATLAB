function Main
%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#1 :Done by Yusri Al-Sanaani
%   This program calls six functions as  following:
%   f (the function of the ODE), euler,RK2nd,RK_polygon ,RK3rd , and RK4th to solve
%   ordinary differential equations
%%  4th order Runge_kutta Method  %%%%%%%%
clear all ; close all ;clc
fprintf('       PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS\n')
fprintf('       HW#1 :Done by Yusri Al-Sanaani\n')
fprintf('       ................................................\n')
fprintf('dy/dx=y+x solved by using 4th order Runge_kutta Method  \n')
xo=0; yo=0;           % initial conditions
h=0.1;                % step size
a=0; b=1;             % the left end of the interval&the right end of the interval
x=a:h:b;              % Interval over which the integration is performed
fprintf('................................................................................\n')
%Exact Solution
Y = exp(x)-x-1;
yex=Y';
%Numerical Solution 
y=RK4th(@f,a,b,h,xo,yo);
OUT = [yex y 100*abs(yex-y) 100*abs(yex-y)./yex];
fprintf('      | Exact Sol.|     |Num Sol.|     |(Exact-Num)|       |(Exact-Num)./Exact|\n')
fprintf('      --------------------------------------------------------------------------\n')
fprintf('      | %0.6f  |     |%0.6f|     |%0.6f   |       |%0.6f    |\n',OUT')
%%%%%%%%%%% plot the numerical solution and the exact solution
figure
plot(x,Y,'o',x,y,'r-')
legend('Exact Solution','Numerical Solution')
xlabel('x')
ylabel('y')
title('dy/dx=y+x solved by using 4th order Runge_kutta Method ')
end





    
