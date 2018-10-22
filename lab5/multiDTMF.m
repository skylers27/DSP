%multiDTMF.m
%Skyler Szot
%input a file of 10 dial tone pairs, decodes phone number

clear all;
close all;

file = input('Enter a file name (including extension): ','s'); %user input

[data, fsamp] = audioread(file);

data = myExpand(data); %expand data

result = []; %initialize result array
for i = 1 : 10 %loop through 10 digits
    
    sample = data((1+(2200*(i-1))):(2200*(i-1)+2000)); %parse
    npts = length(sample); %npts
    freqDiv=fsamp/npts; %calculate frequency axis
    freq=freqDiv*(0:npts/2-1);

    DFT = myDFT(sample,npts); %calcualte DFT
    P = 20*log10(abs(DFT)); %calcualte log scale

    [pks,locs] = findpeaks(P); %use builting to find peaks
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

    x = getNum(vRounded(1),vRounded(2)); %translate freq -> number
    result = [result, x]; %append to full result array
end
result %display full result
soundsc(data,fsamp) %play tone