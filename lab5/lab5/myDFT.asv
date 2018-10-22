%myDFT.m
%Skyler Szot
%calculates the DFT

function y = myDFT(x,npts)
    y = zeros(npts/2,1); %initialize return array

    for k = 1 : npts/2, %loop through k
        km = k - 1; %adjust for index 0
        y(k) = 0;
        for n = 1 : npts, %loop through n
            nm = n - 1; %adjust for index 0
            y(k) = y(k) + x(n) * exp((1j*2*pi*-km*nm)/npts);
        end
    end
end