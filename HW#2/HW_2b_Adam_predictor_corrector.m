function Main
%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%  HW#2 :Done by Yusri Al-Sanaani
%%  the second part of this program is to solve ordinary differential equations
%   using Adam's predictor-corrector method (multistep method).
%   Solution of dy/dx=x+y using Adams predictor-corrector Method
clear all
close all
clc
fprintf('       PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS\n')
fprintf('       HW#2 :Done by Yusri Al-Sanaani\n')
fprintf('       ................................................\n')
h=0.1;               % Step size
x=0:h:1;             % Interval over which the integration is performed 
x(1)=0; y(1)=0;      % initial conditions
n=0;
Y=exp(x)-x-1;      % exact solution 
yex=Y';
APC(n+1,:)=y(1);     % numerical solution 
for i=1:3            % calculating the starting points (y(1),y(2),y(3))using RKth  
    k1=ff(x(i),y(i));
    k2=ff(x(i)+0.5*h,y(i)+0.5*h*k1);
    k3=ff(x(i)+0.5*h,y(i)+0.5*h*k2);
    k4=ff(x(i)+h,y(i)+h*k3);
    x(i+1)=x(i)+h;
    y(i+1)=y(i)+(h/6)*(k1+2*k2+2*k3+k4);
    n=n+1;
    APC(n+1,:)=y(i+1);
end
for i=4:length(x)-1   % calculating the other points using Adams predictor-corrector Method
    y_pr(i)=y(i)+(h/24)*(55*ff(x(i),y(i))-59*ff(x(i-1),y(i-1))+37*ff(x(i-2),y(i-2))...
        -9*ff(x(i-3),y(i-3)));  % y_pr is predicated value
    y(i+1)=y(i)+(h/24)*(9*ff(x(i+1),y_pr(i))+19*ff(x(i),y(i))-5*ff(x(i-1),y(i-1))...
        +ff(x(i-2),y(i-2))); % y is the corrected value
    n=n+1;
    x(i+1)=x(i)+h;
    APC(n+1,:)=y(i+1);
end
OUT = [yex APC 100*abs(yex-APC) 100*abs(yex-APC)./yex]; %numerical & exact outputs
fprintf('       ................................................\n')
fprintf('                        Second part \n')
fprintf('      Solution of dy/dx=x+y using Adams predictor-corrector Method \n')
fprintf('      ---------------------------------------------------------------------\n')
fprintf('      | Exact Sol.|   | Num Sol. |   |(Exact-Num.)|   |(Exact-Num.)./Exact|\n')
fprintf('      ---------------------------------------------------------------------\n')
fprintf('      | %2.6f  |   | %2.6f |   | %2.6f   |   |     %2.6f      |\n',OUT')
fprintf('      ---------------------------------------------------------------------\n')
%subplot(1,2,2);
plot(x,APC,'o',x,Y,'r'),legend('Numerical Solution','Exact Solution')
xlabel('x'),ylabel('y'), title('Solving dy/dx=x+y using Adams predictor-corrector Method')
end 