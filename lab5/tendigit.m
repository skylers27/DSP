function tendigit()
    num = zeros(1,10);
    data = zeros(1,20000);
    for i = 1:10
        num(i) = input(['Enter number ',num2str(i),':']);
        
        [fr,fc] = getFreq(num(i));
        t = 0:1/8000:.25-(1/8000);
        tone1 = sin(2*pi*fr*t);
        tone2 = sin(2*pi*fc*t);
        dtmfSig = tone1 + tone2;
        length(dtmfSig)
        dtmfMax = max(abs(dtmfSig));
        dtmfSig = dtmfSig / (dtmfMax + .05);
        
        data(1+(2000*(i-1)):(2000*(i))) = dtmfSig;
    end
    audiowrite('DTMF.wav',data,8000,'BitsPerSample',8)
end