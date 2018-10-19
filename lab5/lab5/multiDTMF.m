clear all;
close all;

[data, fsamp] = audioread('testfun4.wav');
data = myExpand(data);
result = [];
for i = 1 : 10
    
    sample = data((1+(2200*(i-1))):(2200*(i-1)+2000));
    npts = length(sample);
    freqDiv=fsamp/npts;
    freq=freqDiv*(0:npts/2-1);

    DFT = myDFT(sample,npts);
    P = 20*log10(abs(DFT));
    
    %figure;
    %plot(freq, P)

    %DTFMgen(770,1477);

    [pks,locs] = findpeaks(P);
    threshold = 40;
    v = [];
    for i = 1:length(pks)
        if pks(i) > threshold
            v = [v, freq(locs(i))];
        end
    end
    roundTargets = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
    %vRounded = interp1(roundTargets,roundTargets,realloc,'nearest')
    
    [~,idx] = min(bsxfun(@(x,y)abs(x-y),v,roundTargets.')); %index of closest
    vRounded = roundTargets(idx); %extract values

    x = getNum(vRounded(1),vRounded(2));
    result = [result, x];
end
result