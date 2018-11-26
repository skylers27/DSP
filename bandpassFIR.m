%Skyler Szot
%Band Pass FIR filter

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

%high pass filter
N = 40; %num taps
halfN = (N-1)/2; %M/2 value
cf = 6; %cutoff in Hz
wp = (2*pi*cf)/Fs; %cutoff in radians

for n = 1:ceil(halfN), %shift one for index
    hdhp(n) = sin(pi*(n-1-halfN))/(pi*(n-1-halfN)) - sin(wp*(n-1-halfN))/(pi*(n-1-halfN));
    hdhp(N-n+1) = hdhp(n); %in terms of radians, 6Hz cutoff
end

%low pass filter
cf = 12; %cutoff in Hz
wp = (2*pi*cf)/Fs; %cutoff in radians

for n = 1:ceil(halfN), %shift one for index
    hdlp(n) = sin(wp*(n-1-halfN))/(pi*(n-1-halfN));
    hdlp(N-n+1) = hdlp(n); %in terms of radians, 6Hz cutoff
end

%plot(hd); %plot hd(n)
data = data'; %transpose axis to pass to function
result = convolve(data,hdlp); %convolve series with low pass filter

result = convolve(result,hdhp); %convolve series with high pass filter

%plot both filter coefficients
figure;
plot(hdhp);
hold on;
plot(hdlp);
title('Hd');


%fft plot for both filter frequency responses
nfft = 2^ceil(log2(length(hdhp))); 
xffthp = fft(hdhp,nfft); %calculate fft high pass
xfftlp = fft(hdlp,nfft); %calculate fft low pass
freqRes=Fs/nfft;
freq = freqRes*(0:(nfft/2)-1);
figure;
plot(freq,abs(xfftlp(1:nfft/2)));
hold on;
plot(freq,abs(xffthp(1:nfft/2)));
title('filter frequency response');

%fft plot for resulting convolution with high and low pass filters
nfft = 2^ceil(log2(length(result)));
xfft = fft(result,nfft)/nfft; %calculate fft
freqRes=Fs/nfft;
freq = freqRes*(0:(nfft/2)-1);
figure;
plot(freq,abs(xfft(1:nfft/2)));
title('covolution');