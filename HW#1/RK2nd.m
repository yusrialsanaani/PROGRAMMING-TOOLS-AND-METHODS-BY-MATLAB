function [yusri]=RK2nd(f,a,b,h,xo,yo)
% hens method is a numerical method to solve first order ODE
% equations using 2nd order Runge kutta method
% The inputs of the hens method are :
%  f is the function of the ODE
%  h is the step size of the solving interval
%  xo & yo are the initial conditions
%  a is the left end of the interval
%  b is the right end of the interval
% the output matrix is the solution of an ordinary differential equation.
X=a:h:b;
x=xo;
y=yo;
y(1) = yo;
yusri=[]; %Some variable MAtrix or vector size
for i=1:length(X)
    k1=f(x(i),y(i));
    k2=f(x(i)+h,y(i)+h*k1);
    x(i+1)=x(i)+h;
    y(i+1)=y(i)+(h/2)*(k1+k2);
    yusri(i,:)=y(i);
end 