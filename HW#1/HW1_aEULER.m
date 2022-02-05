function Main
%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%  HW#1 :Done by Yusri Al-Sanaani
%  This program calls six functions as  following:
%  f (the function of the ODE), euler,RK2nd,RK_polygon ,RK3rd , and RK4th to solve
%  ordinary differential equations 
clear all
close all
clc
fprintf('       PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS\n')
fprintf('       HW#1 :Done by Yusri Al-Sanaani\n')
fprintf('       ................................................\n')
fprintf('dy/dx=x+y solved by using Euler method \n')
h = 0.1;        %the step size of the solving interval
a=0;            %the left end of the interval
b=1;            %the right end of the interval
x = a:h:b;      % Interval over which the integration is performed
yo = 0;  xo=0;  %Intital Condition y(xo)=yo=0,xo=0
fprintf('................................................................................\n')
% Exact Solution
Y = exp(x)-x-1;
yex=Y';          %exact output
% Numerical Solution 
y = euler(@f,a,b,h,xo,yo);  %numerical output , @ used  to pass f as a function handle to euler function
OUT = [yex y 100*abs(yex-y) 100*abs(yex-y)./yex]; %numerical & exact outputs
fprintf('      | Exact Sol.|     |Num Sol.|     |(Exact-Num.)|       |(Exact-Num.)./Exact|\n')
fprintf('      --------------------------------------------------------------------------\n')
fprintf('      | %0.6f  |     |%0.6f|     |%0.6f   |       |%0.6f    |\n',OUT')
plot(x,Y,'ko',x,y,'m') %%plot the numerical solution and the exact solution
legend('Exact Solution','Numerical Solution')
xlabel('x')
ylabel('y')
title('dy/dx=x+y solved by using Euler method  ')
fprintf('................................................................................\n')
end