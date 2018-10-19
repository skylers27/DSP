function DTFMgen(fr,fc)
    t = 0:1/8000:2000;
    tone1 = sin(2*pi*fr*t);
    tone2 = sin(2*pi*fc*t);
    dtmfSig = tone1 + tone2;
    dtmfMax = max(abs(dtmfSig));
    dtmfSig = dtmfSig / (dtmfMax + .05); %normalize
    audiowrite('DTMF.wav',dtmfSig,8000,'BitsPerSample',8)
end