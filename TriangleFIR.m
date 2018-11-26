%Skyler Szot
%Low Pass FIR filter with Triangular window

clear all;
close all;

table = readtable('Sig3.xlsx'); %read data
Fs = 50; %frequency interpreted from table
npts = height(table);
data = table{:,2};

%plot fft of raw data
nfft = 2^ceil(log2(npts)); %nfft must be power of 2, use zero padding if necessary
xfft = fft(data,nfft); %calculate fft
freqRes=Fs/nfft;
freq = freqRes*(0:(nfft/2)-1);
figure;
plot(freq,abs(xfft(1:nfft/2))); %determine peaks at 3,9,15 Hz
title('fft of data');

%low pass filter
N = 40; %num taps
halfN = (N-1)/2; %M/2 value
cf = 6; %cutoff frequency in Hz
wp = (2*pi*cf)/Fs; %cutoff frequency in radians

for n = 1:ceil(halfN), %shift one for index
    hd(n) = sin(wp*(n-1-halfN))/(pi*(n-1-halfN)); %calculate value
    hd(N-n+1) = hd(n); %in terms of radians, 6Hz cutoff
end

%window
figure;
%select window function
%window = 1; %rectangular
window = hamming(N); %hamming
%window = hann(N); %hanning
%window = triangular(N); %triangular

plot(window); %plot window and filter coefficients
title('window');
windowed = hd .* window; %window; multiply elementwise

data = data'; %transpose axis to pass to function
result = convolve(data,hd); %convolve series
resultw = convolve(data,windowed); %convolve series

%plot filter coefficients
figure;
plot(hd); %original
hold on;
plot(windowed); %windowed
title('Hd');

%fft plot for filter frequency response
nfft = 2^ceil(log2(length(hd))); 
xfft = fft(hd,nfft); %calculate fft
xfftw = fft(windowed,nfft); %calculate fft
freqRes=Fs/nfft;
freq = freqRes*(0:(nfft/2)-1);
figure;
plot(freq,abs(xfft(1:nfft/2)));
hold on;
plot(freq,abs(xfftw(1:nfft/2)));
title('filter frequency response');

%fft plot for resulting convolution of data and hd
nfft = 2^ceil(log2(length(result)));
xfft = fft(result,nfft)/nfft; %calculate fft
xfftw = fft(resultw,nfft)/nfft; %calculate fft
freqRes=Fs/nfft;
freq = freqRes*(0:(nfft/2)-1);
figure;
plot(freq,abs(xfft(1:nfft/2)));
hold on;
plot(freq,abs(xfftw(1:nfft/2)));
title('covolution');