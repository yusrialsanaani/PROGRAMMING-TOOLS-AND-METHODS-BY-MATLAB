%function Main
%   PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#2 :Done by Yusri Al-Sanaani
%   This program consists of 2 parts :
%%  the first part contains RK4th2 function which is a general function to
%   solve any set of 1st order ODEs, so you can manually change the
%   ODEs set in the function of the ODE  (let's call it f) as a function
%   handle to RK4th2 function
%   also , RK4th2 function can be called to solve higher order ODEs using
%   fourth Runge Kutta method by taking space state representation for
%   higher order ODE to get a set of 1st order ODEs,
%   let us take this example y"+y'-2y=0  to solve it by method mentioned
%   above.
%   Solution of y"+y'-2y=0  Using fourth Runge Kutta method
%   by reducing the order of this ODE to produce 2 coupled 1st order ODEs by assuming
%             y1 = y
%             y2 = y'
%  Then the original system can be rewritten as
%             y2' = 2y1 -y2
%             y1'=y2
%  RK4th2 can solve coupled systems like this
%  The subfunction (let's call it f) now becomes
%             function [ODE]=f(x,y)
%             ODE=[y(2);2*y(1)-y(2)];
%             end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc
fprintf('       PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS\n')
fprintf('       HW#2 :Done by Yusri Al-Sanaani\n')
fprintf('       ................................................\n')
h=0.1;                       % Step size
a=0; b=1;                    % The left & right ends of the interval
x=a:h:b;                     % Interval over which the integration is performed 
xo=0 ; yo=[1;-2];            % initial conditions
Y=exp(-2*x);                 % Exact Solution
yex=Y';                      % invert Y to be easy to display it as column vector 
y=RK4th2(@f,a,b,h,xo,yo);   % Numerical Solution 
%@f used  to pass f (the function of the ODE )as a function handle to RK4th2 function
OUT = [yex y 100*abs(yex-y) 100*abs(yex-y)./yex]; %numerical & exact outputs
fprintf('                        First part \n')
fprintf('      Solution of ddy/dx+dy/dx-2y=0 using RK4th method\n')
fprintf('      ---------------------------------------------------------------------\n')
fprintf('      | Exact Sol.|   | Num Sol. |   |(Exact-Num.)|   |(Exact-Num.)./Exact|\n')
fprintf('      ---------------------------------------------------------------------\n')
fprintf('      | %2.6f  |   | %2.6f |   | %2.6f   |   |     %2.6f      |\n',OUT')
fprintf('      ---------------------------------------------------------------------\n')
% plotting the numerical solution and the exact solution
%subplot(1,2,1);
plot(x,Y,'o',x,y,'r'),legend('Exact Solution','Numerical Solution')
xlabel('x'),ylabel('y'), title('Solution of ddy/dx+dy/dx-2y=0 using RK4th method')
%end