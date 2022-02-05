function [yusri]= RK4th2(f,a,b,h,xo,yo)
%   RK4th2 function is a numerical method to solve system of ordinary
%   differential equations.
%   The inputs of the RK4th2 are :
%   f is the function of the ODE
%   h is the step size of the solving interval
%   xo & yo are the initial conditions
%   a is the left end of the interval
%   b is the right end of the interval
%   it gives an output solution for any system of ODEs
x(1)=xo; 
y=yo;
X=a:h:b;
k=0;
yusri(k+1,:)=y(1);
for i=1:length(X)-1
    k1=f(x(i),y);
    k2=f(x(i)+0.5*h,y+0.5*h*k1);
    k3=f(x(i)+0.5*h,y+0.5*h*k2);
    k4=f(x(i)+h,y+h*k3);
    x(i+1)=x(i)+h;
    y=y+(h/6)*(k1+2*k2+2*k3+k4);
    k=k+1;
    yusri(k+1,:)=y(1,1);
end 
end
