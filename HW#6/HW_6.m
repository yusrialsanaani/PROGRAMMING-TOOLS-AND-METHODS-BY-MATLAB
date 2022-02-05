%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#6 :Done by Yusri Al-Sanaani
%% 
clc ,clear all ,close all
%%   Part#1 Solution of non-square systems by using Least Square Error Method to fit data.
%    Least Square Error Method to solve overconstrained system 
%    we want to fit a line through the following pionts :
x=[1 2 3 4 5 6];
y=[3.5 0.5 -1.5 -3 -4.5 -7];
%    where y=a+bx . so , we can consrtuct an overconstrained system from the 
%    given points above, as following:
%    a+b=3.5
%    a+2b=0.5
%    a+3b=-1.5 
%    a+4b=-3
%    a+5b=-4.5
%    a+6b=-7
%    then define A Matrix with size of 6*2 to hold thw parameters of the
%    left side of previous equations
%    also , define b vector to hold the corresponding parameters in
%    the right side 
A=[1 1;1 2;1 3;1 4;1 5;1 6];
b=y;
%    now ,apply Least Square Error equation to fit data
X=inv(A'*A)*A'*b';
%    resulting solution with fitted line
xp=pinv(A)*b';
Y=X(1)+X(2)*x;
plot(x,y,'*',x,Y,'g'), title('Least Square Error Method to fit data')
xlabel('X'), ylabel('Y'),legend('Data Points','Fitted Line')
grid
fprintf('   PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS\n')
fprintf('   HW#6 :Done by Yusri Al-Sanaani\n')
fprintf('Part#1 Least Square Error Method to Fit Data with y=a+bx\n')
fprintf('---------------------------------------------\n')
fprintf('     [ a= %2.4f ]    ;   [ b= %2.4f ]\n',X(1),X(2))
fprintf('---------------------------------------------\n')
%% Part#2 Solution of underconstrained system by using minimum length method
%    X1+X2+X3=1
%    X1-X3=2
%    define AA Matrix to hold the left side parameters of the previous equations
%    also , define bb matrix to hold the corresponding parameters in
%    the right side 
AA=[1 1 1;1 0 -1];
bb=[1;2];
%    apply minimum length equation to solve the previous system 
x=AA'*inv(AA*AA')*bb;
xp=pinv(AA)*bb;
fprintf('Part#2 Solution of Underconstrained System by using Minimum Length Method\n')
fprintf('    |   x1   |       |   x2   |   |   x3    |\n')
fprintf('    | %2.4f |       | %2.4f |   | %2.4f | \n',x)
fprintf('---------------------------------------------\n')