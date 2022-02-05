function [yusri]= RK4th2(f,a,b,h,to,xo)
%   RK4th2 function is a numerical method to solve system of ordinary
%   differential equations.
%   The inputs of the RK4th2 are :
%   f is the function of the ODE
%   h is the step size of the solving interval
%   xo & yo are the initial conditions
%   a is the left end of the interval
%   b is the right end of the interval
%   it gives an output solution for any system of ODEs
t(:,:)=to; 
x=xo;
T=a:h:b;
k=0;
yusri(k+1,:)=x;
for i=1:length(T)-1
    k1=f(t(i),x);
    k2=f(t(i)+0.5*h,x+0.5*h*k1);
    k3=f(t(i)+0.5*h,x+0.5*h*k2);
    k4=f((i)+h,x+h*k3);
    t(i+1)=t(i)+h;
    x=x+(h/6)*(k1+2*k2+2*k3+k4);
    k=k+1;
    yusri(k+1,:)=x;
end 
end
