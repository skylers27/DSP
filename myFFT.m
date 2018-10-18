function bin = myFFT(x)
    N = length(x);
    if N == 1
        bin = x
        return
    end
    Xeven = x(1:2:N);
    Xodd = x(2:2:N);
    
    Xeven = myFFT(Xeven);
    Xodd = myFFT(Xodd);

    for k = 0:N/2-1
        km = k + 1;
        cmplx = Xodd(km) * exp((1j * 2*pi * k)/N);
        bin(km) = Xeven(km) + cmplx;
        bin(km+N/2) = Xeven(km)-cmplx;
    end

end