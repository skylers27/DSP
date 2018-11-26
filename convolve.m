function Y = convolve(x,h) %pass 2 arrays to convolve
    m=length(x); %get lengths
    n=length(h);
    X=[x,zeros(1,n)]; %append zeros
    H=[h,zeros(1,m)];
    for i=1:n+m-1 %for each value
        Y(i)=0;
        for j=1:m %calculate impulse response
            if(i-j+1>0)
            Y(i)=Y(i)+X(j)*H(i-j+1); %multiply individual values
            else
            end
        end
    end
end