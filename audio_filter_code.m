[x,fs]= audioread('audio.wav');
N = length(x);
% Plot the magnitude spectrum of the noisy audio
a =0 :N-1;
X = fft(x,N);
plot(a,abs(X));
f = (0:N-1)*fs/N ;
f = (-N/2:N/2-1)*fs/N;
figure;
plot(f,abs(fftshift(X))/N);
load ('myfilter.mat');
filtered= filter(myfilter,x);
audiowrite('filtered.wav',filtered,fs);
% Plot the magnitude spectrum of the Filtered audio
z = fft(filtered,N);
figure;
plot(f,abs(fftshift(z))/N);

freqz(myfilter);
impz(myfilter);

%at 2X
filtered_2x = resample(filtered,1,2);
N2 = length(filtered_2x);
z_2 = fft(filtered_2x,N2);
f2=(-N2/2:N2/2-1)*fs/N2;
figure;
plot(f2,abs(fftshift(z_2))/N2);
title('audio played at 2x');
