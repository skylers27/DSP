clear all;
close all;

%initialize arbitrary function
f1 = input('enter frequency 1 ==> \n');
f2 = input('enter frequency 2 ==> \n');
power = input('enter a power n, for 2^n data points ==> \n');

t = .01:.01:.01*2^power;
x = sin(f1*2*pi*t) + sin(f2*2*pi*t);
fsamp = 100;
N = length(x);

%data
figure;
subplot(2,1,1)
plot(t,x)

%myFFT
test = myFFT(x);
test = 20*log10(abs(test));
freqDiv=fsamp/N;
freq = freqDiv*(0:N/2-1);

subplot(2,1,2)
plot(freq, test(1:N/2))
hold on;

actual = fft(x);
actual = 20*log10(abs(actual));
plot(freq, actual(1:N/2))

%MSE calculation
sumxe = 0;
for i = 1:N/2 %only first half
    sumxe = sumxe + ((test(i)-actual(i)).^2); %accumulate
end
MSE = sumxe/(N/2) %MSE