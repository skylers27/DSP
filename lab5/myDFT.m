function y = myDFT(x)
    npts = length(x)-1
    y = zeros(npts/2,1);

    for k = 1 : npts/2,
        km = k - 1;
        y(k) = 0;
        for n = 1 : npts,
            nm = n - 1;
            y(k) = y(k) + x(n) * exp((1j*2*pi*-km*nm)/npts);
        end
    end
end