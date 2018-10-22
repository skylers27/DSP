%myExpand.m
%Skyler Szot
%Expands data based on mu-law expanding algorithm

function y = myExpand(x)
    y = zeros(1,length(x));
    for i = 1:length(x)
        mu = 255; %industry standard
        y(i) = sign(x(i)) * (1/mu) * ((1+mu).^abs(x(i))-1);
    end
end