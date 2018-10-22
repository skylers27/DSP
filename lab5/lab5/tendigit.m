%tendigit.m
%Skyler Szot
%Prompts user for 10 inputs, converts to corresponding dial tone and saves
% in .wav format as desired file name

function tendigit()
    data = zeros(1,22000); %intialize data array 
    %input file name
    file = input('Enter output file name (including extension): ','s');
    
    for i = 1:10 %generate 10 tones
        num = input(['Enter number ',num2str(i),':'], 's'); %input number
        
        [fr,fc] = getFreq(num); %get corresponding frequencies
        
        t = 0:1/8000:.25-(1/8000); %time array for .25 seconds
        tone1 = sin(2*pi*fr*t); %tone 1 data
        tone2 = sin(2*pi*fc*t); %tone 2 data
        
        dtmfSig = tone1 + tone2; %overlay tones
        dtmfMax = max(abs(dtmfSig)); %calculate max
        dtmfSig = dtmfSig / (dtmfMax + .05); %normalize
        
        dtmfSig = [dtmfSig, zeros(1,200)]; %append delay between tones
        
        data(1+(2200*(i-1)):(2200*(i))) = dtmfSig; %move to final array
    end
    compdata = compand(data,255,max(abs(data))); %compand data
    audiowrite(file,compdata,8000,'BitsPerSample',8) %write wave file
    soundsc(data,8000) %play wave file
end