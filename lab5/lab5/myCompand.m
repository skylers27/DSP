%myCompand.m
%Skyler Szot
%Compands data based on mu-law companding algorithm

function y = myCompand(x)
    y = zeros(1,length(x));
    for i = 1:length(x)
        mu = 255; %industry standard
        y(i) = sign(x(i)) * ((log(1 + mu*abs(x(i))))/log(1 + mu));
    end
end