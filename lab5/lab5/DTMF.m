clear all;
close all;

[data, fsamp] = audioread('dtmf003.wav');

npts = 2000;
freqDiv=fsamp/npts;
freq=freqDiv*(0:npts/2-1);

figure;
DFT = myDFT(data,npts);
P = 20*log10(abs(DFT));
plot(freq, P)

%DTFMgen(770,1477);

[pks,locs] = findpeaks(P);
threshold = 40;
realloc = [];
for i = 1:length(pks)
    if pks(i) > threshold
        realloc = [realloc, freq(locs(i))];
    end
end
roundTargets = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
vRounded = interp1(roundTargets,roundTargets,realloc,'nearest')

x = getNum(vRounded(1),vRounded(2))