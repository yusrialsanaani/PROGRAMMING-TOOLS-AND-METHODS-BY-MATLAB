%%   PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%%   HW#7 :Done by Yusri Al-Sanaani

%%   SVD 
% A can be a (m*n) matrix so it can be decomposed into U(m,m) S(m,n) V(n,n)'
% U & V are orthogonal matrix , S is diagnoal matrix
% if A is not square , S will fall in the following cases
% S has columns more than raws if m<n 
% S has raws more than columns if m>n
% let p=min(m,n) then,
% A=Up*Sp*Vp' where Up(m,p),Sp(p,p),& Vp(p,n) are eign vectors coresponding to
% non-zero eignvalue
%% this modified SVD is used to solve overconstrained &/or underconstrained
% systems where X=Vp*inv(Sp)*Up'*b , let A+=Vp*inv(Sp)*Up',so, X=A+*b.
%% case #1 : if n=m=p (square full rank)
% X=Vp*inv(Sp)*Up'*b or X=(A+)*b or X=inv(A)*b
%% case #2 if m>n, so p=n... least square (overconstrained)
% X=Vn*inv(Sn)*Un'*b or X=A+*b.
%% case #3: m<n, p=m ... underconstrained system ( minumum length)
% X=Vm*inv(Sm)*Um'*b or X=A+*b.
%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%   Part#1 Solution of overconstrained system by using SVD,LSE,& pinv function
%    x1+2x2+3x3=1
%    4x1+5x2+6x3=2
%    7x1+8x2+9x3=3
%    10x1+11x2+14x3=4
%    define A Matrix to hold the parameters of the left side of previous equations
%    also , define b vector to hold the corresponding parameters in the right side 
clc ,clear all ,close all
A=[1 2 3;4 5 6;7 8 9;10 11 14];
b=[1;2;3;4];
[U,S,V]=svd(A);     %   decompose A into U,S,&V
AA=U*S*V';          %   show that A=USV'
[m,n]=size(A);      %   since [m,n]=[4,3],m>n , so S has more raws
                    %   considering only eign vectors coresponding to
                    %   non-zero eignvalue, p=n
Vp=V;
Sp=S(1:n,1:n);
Up=U(:,1:n);
Ap=Vp*inv(Sp)*Up';    %  evaluate A+
x_p=Ap*b;             %  Solution of underconstrained system by SVD
x_ls=inv(A'*A)*A'*b;  %  Solution of underconstrained system by LSE 
xp=pinv(A)*b;         %  Solution of underconstrained system by(pinv)function
fprintf('   PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS\n')
fprintf('   HW#7 :Done by Yusri Al-Sanaani\n')
fprintf('Part#1 Solution of overconstrained system by using SVD,LSE,& pinv function\n')
fprintf('---------------------------------------------\n')
fprintf('    |   x1    |       |   x2   |   |   x3    \n')
fprintf('    | %2.4f |       | %2.4f |   | %2.4f   \n',x_p,x_ls,xp)
fprintf('---------------------------------------------\n')
%%   Part#2 Solution of underconstrained system by using SVD,LSE,& pinv function
%    5x1+2x2+3x3=0
%    2x1+x2=5
%    define A Matrix to hold the parameters of the
%    left side of previous equations
%    also , define b vector to hold the corresponding parameters in
%    the right side 
A=[5 2 3;2 1 0];
b=[0;5];
[U,S,V]=svd(A);         %   decompose A into U,S,&V
AA=U*S*V';              %   show that A=USV'
[m,n]=size(A);          %   [m,n]=[2,3],since m<n, so p=m
Vp=V(:,1:m);
Sp=S(1:m,1:m);
Up=U;
Ap=Vp*inv(Sp)*Up';     %    evaluate A+
x_p=Ap*b;              %    Solution of underconstrained system by SVD
x_min=A'*inv(A*A')*b;  %    Solution of underconstrained system by ML 
xp=pinv(A)*b;          %    Solution of underconstrained system by(pinv)function
fprintf('Part#2 Solution of underconstrained system by using SVD,ML,& pinv function\n')
fprintf('---------------------------------------------\n')
fprintf('    |   x1    |       |   x2   |   |   x3    \n')
fprintf('    | %2.4f |       | %2.4f |   | %2.4f   \n',x_p,x_min,xp)
fprintf('---------------------------------------------\n')
