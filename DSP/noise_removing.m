
clc ;close all
load('EMG_R1.mat')
load('EMG_R2.mat')
EMG_Rii=EMG_R1-EMG_R2;    % get the difference of two signals
fs=256;                   % sample frequency 
T=1/fs;                   % time step
t=T:T:length(EMG_Rii)/fs; % total time interval of signal
t=t';
%% Part#1 plotting the EMG signal versus time
figure
plot(t,EMG_Rii);title(' Original EMG-Right Signal');axis tight
EMG_Ri=EMG_Rii(1:70000,1); % reduce the size of signal to be easy to deal with
t=T:T:length(EMG_Ri)/fs;   % time interval of reduced signal
t=t';
figure
plot(t,EMG_Ri);title(' Part of EMG-Right Signal');
xlabel('Time'); ylabel('EMG-R'); legend(' EMG-Right Signal');axis tight
%% Part# 2 the size & the duration of the signal
sizeof_org=size(EMG_Rii);           % size of original signal
Durationoforg=length(EMG_Rii)/fs;   % duration of original signal
sizeof_signal=size(EMG_Ri);         % size of reduced signal
Durationofsignal=length(EMG_Ri)/fs; % duration of reduced signal
fprintf('-----------------------------------------\n')
fprintf('The Size of Orginal Signal=%1.0f * %1.0f \n ',sizeof_org)
fprintf('-----------------------------------------\n')
fprintf('The Duration of signal= %1.0f sec \n',Durationoforg)
fprintf('-----------------------------------------\n')
fprintf('-----------------------------------------\n')
fprintf('The Size of New Signal=%1.0f * %1.0f \n ',sizeof_signal)
fprintf('-----------------------------------------\n')
fprintf('The Duration of new Signal=%1.0f sec\n',Durationofsignal)
fprintf('-----------------------------------------\n')

%% Part#3 RMS for Original Signal 
sum= 0;
for w=1:length(t)
 f=EMG_Ri(w);
   sum= sum+f.^2;
end
h=length(t);
f_rms=sqrt(sum./h);

fprintf('-----------------------------------------\n')
fprintf('EMG_R(rms) Original signal=  %f\n',f_rms)
fprintf('-----------------------------------------\n')
%% part#4 removing the noise in signal using the backward-looking moving average filter. 
EMG_Rii=EMG_R1-EMG_R2;
EMG_Ri=EMG_Rii(1:70000,1);
EMG_R= EMG_Ri-mean(EMG_Ri); % remove DC shift
fs=256;
T=1/fs;
t=T:T:length(EMG_R)/fs;
t=t';
N=100;
for k=N:length(EMG_R)
    sum=0;
    for n=1:N
        sum=sum+EMG_R(k+n-N);
    end
        EMG_filt_bw(k)=sum/N;
end
figure
plot(t,EMG_R,t,EMG_filt_bw);title('EMG filterd using Backword moving filter');
xlabel('time'); ylabel(' FILTERD EMG-R');legend('EMG-R with noise','EMG-R without noise');
axis tight
%% Part# 5 the RMS value of EMG_filterd_20
t=T:T:length(EMG_R)/fs;
sum= 0;
for n=1:length(t)
    f=EMG_filt_bw(n);
    sum= sum+f.^2;
end
b=length(t);
f_rms_20=sqrt(sum./b);
fprintf('-----------------------------------------\n')
fprintf('Filtered EMG-R(rms)(N=20)=  %f\n',f_rms_20)
fprintf('-----------------------------------------\n')
%% the RMS value of EMG_filterd_10
N10=10;
for m=N10:length(EMG_R)
    sum=0;
    for n1=1:N10
        sum=sum+EMG_R(m+n1-N10);
    end
        EMG_filt_fw_10(m)=sum/N10;
end
t=T:T:length(EMG_R)/fs;
sum= 0;
for n10=1:length(t)
    f=EMG_filt_fw_10(n10);
    sum= sum+f.^2;
end
c=length(t);
f_rms_10=sqrt(sum./c);
fprintf('-----------------------------------------\n')
fprintf('Filtered EMG-R(rms)(N=10)=  %f\n',f_rms_10)
fprintf('-----------------------------------------\n')
%% the RMS value of EMG_filterd_30
N30=30;
t=T:T:length(EMG_R)/fs;
for k1=N30:length(EMG_R)
    sum=0;
    for n2=1:N30
        sum=sum+EMG_R(k1+n2-N30);
    end
        EMG_filt_fw_30(k1)=sum/N30;
end
sum= 0;
for n30=1:length(t)
    f=EMG_filt_fw_30(n30);
    sum= sum+f.^2;
end
d=length(t);
f_rms_30=sqrt(sum./d);
fprintf('-----------------------------------------\n')
fprintf('Filtered EMG-R(rms)(N=30)=  %f\n',f_rms_30)
fprintf('-----------------------------------------\n')
%% the RMS value of EMG_filterd_50
t=T:T:length(EMG_R)/fs;
N50=50;
for k2=N50:length(EMG_R)
    sum=0;
    for n3=1:N50
        sum=sum+EMG_R(k2+n3-N50);
    end
        EMG_filt_fw_50(k2)=sum/N50;
end
sum= 0;
for n50=1:length(t)
    f=EMG_filt_fw_50(n50);
    sum= sum+f.^2;
end
g=length(t);
f_rms_50=sqrt(sum./g);
fprintf('-----------------------------------------\n')
fprintf('Filtered EMG-R(rms)(N=50)=  %f\n',f_rms_50)
fprintf('-----------------------------------------\n')
%% the RMS value of EMG_filterd_100
N100=100;
t=T:T:length(EMG_R)/fs;
for k3=N100:length(EMG_R)
    sum=0;
    for n4=1:N100
        sum=sum+EMG_R(k3+n4-N100);
    end
        EMG_filt_fw_100(k3)=sum/N100;
end
sum= 0;
for q=1:length(t)
    f=EMG_filt_fw_100(q);
    sum= sum+f.^2;
end
y=length(t);
f_rms_100=sqrt(sum./y);
fprintf('-----------------------------------------\n')
fprintf('Filtered EMG-R(rms)(N=100)=  %f\n',f_rms_100)
fprintf('-----------------------------------------\n')
%% db attenuation
%  EMG_R to N=20
atenuation1= 20*log(f_rms_20/f_rms);
fprintf('attenuation in db from original signal to (N=20)=%f\n',atenuation1);
% N=10 to N=20 
atenuation2= 20*log(f_rms_20/f_rms_10);
fprintf('attenuation in db (N=10 to N=20)=%f\n',atenuation2);
% N=20 to N=30 
atenuation3= 20*log(f_rms_30/f_rms_20);
fprintf('attenuation in db( N=20 to N=30)=%f\n',atenuation3);
% N=30 to N=50 
atenuation4= 20*log(f_rms_50/f_rms_30);
fprintf('attenuation in db (N=30 to N=50)=%f\n',atenuation4);
%N=50 to N=100
atenuation5= 20*log(f_rms_100/f_rms_50);
fprintf('attenuation in db (N=50 to N=100)=%f\n',atenuation5);
