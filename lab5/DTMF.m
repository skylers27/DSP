%DTMF.m
%Skyler Szot
%opens a dial tone wav file and decodes the corresponding number

clear all;
close all;

file = input('Enter a file name: ','s'); %user input

[data, fsamp] = audioread(file); %no need for expansion

npts = 2000; %number of points
freqDiv=fsamp/npts; %calculate frequency axis
freq=freqDiv*(0:npts/2-1);

figure;
DFT = myDFT(data,npts); %calculate DFT
P = 20*log10(abs(DFT)); %translate to log scale
plot(freq, P) %plot periodogram
xlabel('frequency (Hz)')
title(['Periodogram: ', file])

[pks,locs] = findpeaks(P); %use built in to find peaks
threshold = 40; %threshold to remove all but actual tones
v = []; %initialize real locations array

for i = 1:length(pks)
    if pks(i) > threshold %filter
        v = [v, freq(locs(i))]; %append to real location array
    end
end

%round to nearest actual value
roundTargets = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
[~,idx] = min(bsxfun(@(x,y)abs(x-y),v,roundTargets.')); %index of closest
vRounded = roundTargets(idx); %extract values

number = getNum(vRounded(1),vRounded(2)) %translate freq -> number
soundsc(data,fsamp) %play tone