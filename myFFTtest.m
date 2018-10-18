clear all;
close all;

%init
f1 = 5;
f2 = 8;

t = .01:.01:.01*2^15;
x = sin(f1*2*pi*t) + sin(f2*2*pi*t);
fsamp = 100;
npts = length(x);

%data
figure;
subplot(3,1,1)
plot(t,x)

%myFFT
test = myFFT(x)
test = 20*log10(abs(test));
freqDiv=fsamp/npts;
freq = freqDiv*(0:npts/2-1)

subplot(3,1,2)
plot(freq, test(1:npts/2))

actual = fft(x);
subplot(3,1,3)
plot(freq, actual(1:npts/2))