%getFreq.m
%Skyler Szot
%translates value to frequency

function [fr, fc] = getFreq(x)
    %check all cases
    if x == '1'
        fr = 697;
        fc = 1209;
    elseif x == '2'
        fr = 697;
        fc = 1336;
    elseif x == '3'
        fr = 697;
        fc = 1477;
    elseif x == '4'
        fr = 770;
        fc = 1209;
    elseif x == '5'
        fr = 770;
        fc = 1336;
    elseif x == '6'
        fr = 770;
        fc = 1477;
    elseif x == '7'
        fr = 852;
        fc = 1209;
    elseif x == '8'
        fr = 852;
        fc = 1336;
    elseif x == '9'
        fr = 852;
        fc = 1477;
    elseif x == '0'
        fr = 941;
        fc = 1336;
    elseif x == '*'
        fr = 941;
        fc = 1209;
    elseif x == '#'
        fr = 941;
        fc = 1477;
    elseif x == 'A'
        fr = 697;
        fc = 1633;
    elseif x == 'B'
        fr = 770;
        fc = 1633;
    elseif x == 'C'
        fr = 852;
        fc = 1633;
    elseif x == 'D'
        fr = 941;
        fc = 1633;
    end
    
end