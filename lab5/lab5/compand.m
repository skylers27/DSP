function y = compress(x)
    y = zeros(1,length(x));
    for i = 1:length(x)
        absmu = mean(abs(x));
        mu = mean(x);
        y(i) = sgn(x(i)) * ((ln(1 + absmu))/ln(1 + mu));
    end
end