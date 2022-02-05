function [yusri]=RK4th(f,a,b,h,xo,yo)
% Runge_Kutu_4th is a numerical method to solve first order ODE
% equations using fourth Runge kutta " the most commonly used"
% The inputs of the Runge_Kutu_4th  method are :
%  f is the function of the ODE
%  h is the step size of the solving interval
%  xo & yo are the initial conditions
%  a is the left end of the interval
%  b is the right end of the interval
% the output matrix is the solution of an ordinary differential equation.
X=a:h:b;
x(1)=xo;
y(1)=yo;
yusri=[]; %Some variable MAtrix or vector
for i=1:length(X)
    k1=f(x(i),y(i));
    k2=f(x(i)+0.5*h,y(i)+0.5*h*k1);
    k3=f(x(i)+0.5*h,y(i)+0.5*h*k2);
    k4=f(x(i)+h,y(i)+h*k3);
    x(i+1)=x(i)+h;
    y(i+1)=y(i)+(h/6)*(k1+2*k2+2*k3+k4);
    yusri(i,:)=y(i);
end 