%DTFMgen.m
%Skyler Szot
%input 2 frequencies and generate 2 tones to output file

function DTMFgen()
    %user input, freq must be exact
    fr = input('Enter row frequency: ');
    fc = input('Enter column frequency: ');
    file = input('Enter output file name: ','s');
    t = 0:1/8000:.25; %time array
    tone1 = sin(2*pi*fr*t); %tone 1
    tone2 = sin(2*pi*fc*t); %tone 2
    dtmfSig = tone1 + tone2; %overlay tones
    dtmfMax = max(abs(dtmfSig)); %calculate max
    dtmfSig = dtmfSig / (dtmfMax + .05); %normalize
    audiowrite(file,dtmfSig,8000,'BitsPerSample',8) %write to output
end