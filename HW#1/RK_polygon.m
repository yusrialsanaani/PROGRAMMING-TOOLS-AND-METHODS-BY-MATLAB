function [yusri]=RK_polygon(f,a,b,h,xo,yo)
% polygon method is a numerical method to solve first order ODE
% equations using 2nd order Runge kutta.
% The inputs of the polygon  method are :
%  f is the function of the ODE
%  h is the step size of the solving interval
%  xo & yo are the initial conditions
%  a is the left end of the interval
%  b is the right end of the interval
% the output matrix is the solution of an ordinary differential equation.
X=a:h:b;
x=xo;
y=yo;
y(1)=yo;
yusri=[]; %Some variable MAtrix or vector size
for i=1:length(X)
    k1=f(x(i),y(i));
    k2=f(x(i)+0.5*h,y(i)+0.5*h*k1);
    x(i+1)=x(i)+h;
    y(i+1)=y(i)+h*k2;
    yusri(i,:)=y(i);
end 