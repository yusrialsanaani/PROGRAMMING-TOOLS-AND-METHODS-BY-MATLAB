% Parameters:
N = 64; % Must be a power of two
T = 1; % Set sampling rate to 1
f = 0.25; % Sinusoidal frequency in cycles per sample
A = 1; % Sinusoidal amplitude
phi = 0; % Sinusoidal phase
n = [0:N-1];
x = cos(2*pi*n*f*T); % Signal to analyze
X = fft(x); % Spectrum
% plotting the sinusoid
ni = [0:.1:N-1];
xi = cos(2*pi*ni*f*T);
figure(1)
plot(ni,xi)
grid;
xlabel('Time');
ylabel('Amplitude');
title('Sinusoid whose f = 0.25 Fs');
% plotting the FFT
magX = abs(X);
mag = (magX*2)/N;
fn = [0:1.0/N:1-1.0/N]; % Normalized frequency axis
figure(2)
stem(fn,mag)
xlabel('Normalized Frequency (cycles per sample))');
ylabel('Magnitude (Linear)');
% Plotting FFT up to half the sampling rate
mag1 = mag(1:(size(mag,2)/2));
fn1 = fn(1:(size(fn,2)/2));
figure(3)
stem(fn1,mag1)
xlabel('Normalized Frequency (cycles per sample))');
ylabel('Magnitude (Linear)');
