function [ODE]=f(x,y)
%f is the function of the ODE as a function handle to
%RK4th2 function
ODE(:,:)=[y(2);2*y(1)-y(2)];
end
