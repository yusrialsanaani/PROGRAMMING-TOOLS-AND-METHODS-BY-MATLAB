%%  PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%   HW#6 :Done by Yusri Al-Sanaani
%% 
clc;clear all;close all

t=[0.05;0.10;0.15;0.20;0.25;0.30;0.35;0.40;0.45;0.50];
y=[0.48;0.89;1.11;1.35;1.58;1.65;1.64;1.65;1.61;1.48];

f=log(y./sin(pi.*t));

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=[ones(10,1),t];
b=f; 
X=(A'*A)\(A'*b); 
F=X(1)+X(2)*t;      % fitted result

plot(t,f,'*',t,F,'g'), title('Least Square Error Method to fit data')
xlabel('t'), ylabel('Y'),legend('Data Points','Fitted Line')
grid
fprintf('   PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS\n')
fprintf('   HW#6 :Done by Yusri Al-Sanaani\n')
fprintf('Part#1 Least Square Error Method to Fit Data with y=a*exp(bt)*sin(pi*t)\n')
fprintf('---------------------------------------------\n')
fprintf('     [ ln(a)= %2.4f ]    ;   [ b= %2.4f ]\n',X(1),X(2))
fprintf('---------------------------------------------\n')
xp=pinv(A)*f;
b=[xp(1) xp(2) ];
fprintf('       a1        a2        \n')
disp(b)
fprintf('-----------------------------------------------------------\n')