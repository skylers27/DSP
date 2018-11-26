function w = triangular(N) %pass N
    M = (N-1)/2;
    for n = 1:ceil(M)
        w(n) = 2*(n-1)/N;
        w(N-n+1) = w(n);
    end
end