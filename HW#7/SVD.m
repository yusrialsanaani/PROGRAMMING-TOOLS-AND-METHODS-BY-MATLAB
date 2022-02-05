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

clc;clear all;close all
x=[0.26;0.83;0.45;0.5;-0.19;0.57;-0.29;0.99;-0.36;-0.11];
y=[0.44;1.79;-0.29;0.53;1.65;-0.22;0.91;0.82;1.24;1.33];
f=[5.95;13.62;3.94;10.53;12.39;8.96;11.36;14.83;13.77;14.06];
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=[x.^2,x.*y,ones(10,1)];
b=f; 
[U,S,V]=svd(A);         %   decompose A into U,S,&V
[m,n]=size(A);          %   [m,n]=[2,3],since m<n, so p=m
Vp=V;
Sp=S(1:n,1:n);
Up=U(:,1:n);
Ap=Vp*inv(Sp)*Up';    %  evaluate A+
X=Ap*b ;              %  Solution of underconstrained system by SVD
%X=(A'*A)\(A'*b); 
%X=inv(A'*A)*A'*b;  %  Solution of underconstrained system by LSE 
T=X(1)*x.^2+X(2)*x.*y+X(3);      % fitted result
dx=linspace(-1,1,800);   %  generates n points linearly spaced between 
dy=linspace(-1,2,800);   %  generates n points linearly spaced between
[x1,y1]=meshgrid(dx,dy);
T1=X(1)*x1.^2+X(2)*x1.*y1+X(3);      % fitted result
mesh(y1,x1,T1)
hidden off         % turns off hidden line removal for the current graph.
axis tight;        % setting the axis limits to the range of the data.
hold on            % to retain the current plot and certain axes properties  
                   % so that subsequent graphing commands add to the existing graph
plot3(y,x,f,'o','MarkerSize',5,'MarkerFaceColor','k') %Plot lines and points in 3-D space.
stem3(y,x,f,'fill')
hidden off
title('fitting data using least square error')
xlabel('X'),ylabel('Y'),zlabel('f(x,y)')
legend('Fitted Line','Data Points')
grid on
fprintf('------------------------------\n')
b=[X(1) X(2) X(3)];
fprintf('       a        b        c  \n')
disp(b)
fprintf('------------------------------\n')
xp=pinv(A)*f;
b=[xp(1) xp(2) xp(3)];
fprintf('       a        b        c  \n')
disp(b)
fprintf('------------------------------\n')
