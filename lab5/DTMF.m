clear all;
close all;

[data, fsamp] = audioread('dtmf002.wav');

npts = length(data);
freqDiv=fsamp/npts;
freq=freqDiv*(0:npts/2-1);

figure;
DFT = myDFT(data);
P = 20*log10(abs(DFT));
plot(freq, P)

%DTFMgen(770,1477);

[pks,locs] = findpeaks(P)
threshold = 40;
realloc = [];
for i = 1:length(pks)
    if pks(i) > threshold
        realloc = [realloc, locs(i)]
    end
end

(1/max(freq))

roundTargets = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
vRounded = interp1(roundTargets,roundTargets,locs,'nearest');