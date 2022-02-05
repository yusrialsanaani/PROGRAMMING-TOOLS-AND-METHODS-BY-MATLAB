function [yusri]=euler(f,a,b,h,xo,yo)
% euler method is  the simple numerical method to solve first order ODE
% The inputs of the euler method are :
%  f is the function of the ODE
%  h is the step size of the solving interval
%  xo & yo are the initial conditions
%  a is the left end of the interval
%  b is the right end of the interval
% the output matrix is the solution of an ordinary differential equation.
X=a:h:b;
x=xo;
y=yo;
yusri=[]; %Some variable MAtrix or vector size
y(1)=yo;
x(1)=xo;
for i=1:length(X)
    x(i+1)=x(i)+h;
    y(i+1)=y(i)+h*f(x(i),y(i));
    yusri(i,:)=y(i);
end 