%%   PROGRAMMING TOOLS AND METHODS FOR MECHATRONICS ENGINEERS
%%   HW#7 :Done by Yusri Al-Sanaani

clc ;close all;clear all
%% initializations 
dt=0.01; t=0:dt:4;
M1=1.5; M2=0.5; L1=0.3; L2=0.1; g=9.8;n=length(t);
theta=[(pi/2)*sin((pi/8)*t);(pi/4)*(t-2)];
dth=[((pi^2)/16)*cos((pi/8)*t);(pi/4)*ones(1,n)];
ddth=[-((pi^3)/128)*sin((pi/8)*t);0*ones(1,n)];
t1_e=theta(1,:); t2_e=theta(2,:); % exact angular positoin 1&2
dt1_e=dth(1,:); dt2_e=dth(2,:);   % exact angular velocity 1&2
tr_exact=[theta' dth' ddth'];     % all exact angular trajectories
c1=cos(theta(1,:));c2=cos(theta(2,:));
s1=sin(theta(1,:));s2=sin(theta(2,:));
c12=cos(theta(1,:)+theta(2,:)); s12=sin(theta(1,:)+theta(2,:));
p_e=[L1*c1+L2*c12 ; L1*s1+L2*s12]; % exact cartesian position
dp_e=[-L1*dth(1,:).*s1-L2*(dth(1,:)+dth(2,:)).*s12 ;
    L1*dth(1,:).*c1+L2*(dth(1,:)+dth(2,:)).*c12];% exact cartesian velocity
%% Part# 1  Calculation the required joint control torques  
T1=(L2^2)*M2*(ddth(1,:)+ddth(2,:))+M2*L1*L2*c2.*(2*ddth(1,:)+ddth(2,:))...
    +(M2+M1)*L1^2*ddth(1,:)-M2*L1*L2*s2.*(dth(2,:).^2)...
    -2*M2*L1*L2*s2.*dth(1,:).*dth(2,:)+M2*L2*g*c12+(M1+M2)*L1*g*c1;
T2=M2*L1*L2*c2.*ddth(1,:)+M2*L2^2*(ddth(2,:)+ddth(1,:))+M2*L1*L2*s2.*dth(1,:).^2+M2*L2*g*c12;
T=[T1;T2];
figure
plot(t,T1,'b',t,T2,'r--'),xlabel('Time(sec)'),ylabel('Torque (newton*meter)') % Plot the torques versus time.
legend('Torque1','Torque2'),title('Torque Plotting'),grid on, axis tight
%% Part#2, simulate the motion of the end point of the manipulator using
%% euler method
th1=theta(1); th2=theta(2); dth1=dth(1); dth2=dth(2);
Th=[th1;th2];       % initial position at t=t0
dTh=[dth1;dth2];    % inital angular velocity at t=t0
M=[((L2)^2)*M2+2*L1*L2*M2*cos(th2)+((L1)^2)*(M1+M2) M2*L2*L2+M2*L1*L2*cos(th2);
    M2*L2*L2+L1*L2*M2*cos(th2) L2*L2*M2];
V=[-M2*L1*L2*sin(th2)*((dth2)^2)-2*M2*L1*L2*sin(th2)*dth1*dth2;M2*L1*L2.*(dth1.^2)];
G=[M2*L2*g*cos(th1+th2)+(M1+M2)*L1*g*cos(th1);M2*L2*g*cos(th1+th2)];
ddTh=inv(M)*(T(1:end,1)-V-G);
k=1;
Traj(k,:)=[Th' dTh' ddTh'];
% simulate the motion of the end point of the manipulator using euler method
for k=2:n
 dTh=dTh+ddTh*dt;
 Th=Th+dTh*dt+0.5*ddTh*dt*dt;
 M=[((L2)^2)*M2+2*L1*L2*M2*cos(Th(2))+((L1)^2)*(M1+M2) M2*L2*L2+M2*L1*L2*cos(Th(2));
    M2*L2*L2+L1*L2*M2*cos(Th(2)) L2*L2*M2];
V=[-M2*L1*L2*sin(Th(2))*((dTh(2))^2)-2*M2*L1*L2*sin(Th(2))*dTh(1)*dTh(2);
    M2*L1*L2.*(dth1.^2)];
G=[M2*L2*g*cos(Th(1)+Th(2))+(M1+M2)*L1*g*cos(Th(1));
    M2*L2*g*cos(Th(1)+Th(2))];
ddTh=inv(M)*(T(1:end,k)-V-G);
Traj(k,:)=[Th' dTh' ddTh'];
end
%% plot the exact & simulation results:
figure
subplot(2,1,1)
plot(t,t1_e,'b',t,Traj(:,1)','r--'),xlabel('Time(sec)'),ylabel('Angular Position \theta(rad)')
legend('\theta_1 exact','\theta_1 simulated'),title('Angular Position \theta_1'), axis tight
%figure
subplot(2,1,2)
plot(t,t2_e,'b',t,Traj(:,2)','r--'),xlabel('Time(sec)'),ylabel('Angular Position \theta(rad)')
legend('\theta_2 exact','\theta_2 simulated'),title('Angular Position \theta_2'), axis tight
figure
subplot(2,1,1)
plot(t,dt1_e,'b',t,Traj(:,3)','r--'),xlabel('Time(sec)'),ylabel('Angular Velocity \theta^.(rad/sec)')
legend('\theta^._1 exact','\theta^._1 simulated'),title('Angular Velocity \theta^._1'), axis tight
%figure
subplot(2,1,2)
plot(t,dt2_e,'b',t,Traj(:,4)','r--'),xlabel('Time(sec)'),ylabel('Angular Velocity \theta^.(rad/sec)')
legend('\theta^._2 exact','\theta^._2 simulated'),title('Angular Velocity \theta^._2'), axis tight
%% Plot the kinematically computed x & y and dynamically simulated x & y.
% cartesian position x & y
p_s=[L1*cos(Traj(:,1)')+L2*cos(Traj(:,1)'+Traj(:,2)') ; 
    L1*sin(Traj(:,1)')+L2*sin(Traj(:,1)'+Traj(:,2)')]; 
% cartesian velocity
dp_s=[-L1*Traj(:,3)'.*sin(Traj(:,1)')-L2*(Traj(:,3)'+Traj(:,4)').*sin(Traj(:,3)'+Traj(:,4)') ; 
    L1*Traj(:,3)'.*cos(Traj(:,3)')+L2*(Traj(:,3)'+Traj(:,4)').*cos(Traj(:,3)'+Traj(:,4)')];
figure
subplot(2,1,1)
plot(t,p_e(1,:),'b',t,p_s(1,:),'r--'),xlabel('Time(sec)'),ylabel('x position(mete)')
legend('x exact','x simulated'),title('cartesian position x'),grid on,axis tight
%figure
subplot(2,1,2)
plot(t,p_e(2,:),'b',t,p_s(2,:),'r--'),xlabel('Time(sec)'),ylabel('y position(mete)')
legend('y exact','y simulated'),title('cartesian position y'),axis tight
figure
subplot(2,1,1)
plot(t,dp_e(1,:),'b',t,dp_s(1,:),'r--'),xlabel('Time(sec)'),ylabel('velocity in x(meter/sec)')
legend('dx exact','dx simulated'),title('cartesian velocity in x'), axis tight
%figure
subplot(2,1,2)
plot(t,dp_e(2,:),'b',t,dp_s(2,:),'r--'),xlabel('Time(sec)'),ylabel('velocity in y(meter/sec)')
legend('dy exact','dy simulated'),title('cartesian velocity in y'), axis tight
%% Plot the errors between the kinematically computed x & y and
%% dynamically simulated x & y.
err=(p_e-p_s);
figure
subplot(2,1,1)
plot(t,err(1,:),'r',t,err(2,:),'b--');title('error between exact trajectroies and simulated trajectories')
xlabel('Time (sec)'),ylabel('error in cartesian position (mete)')
legend('x','y') , axis tight
derr=(dp_e-dp_s);
%figure
subplot(2,1,2)
plot(t,derr(1,:),'r',t,derr(2,:),'b--'),title('error between given velocities and simulated velocities')
xlabel('Time (sec)'),ylabel('error in cartesian velocity (mete/sec)')
legend('dx','dy'), axis tight
