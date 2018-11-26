function w = hamming(N) %pass N
    M = (N-1)/2;
    for n = 1:ceil(M)
        w(n) = 0.54 - 0.46*cos(2*pi*n/N);
        w(N-n+1) = w(n);
    end
end