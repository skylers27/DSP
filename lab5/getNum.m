%getNum.m
%Skyler Szot
%translates frequency to value

function [num] = getNum(fr,fc)
    %check all cases
    if fr == 697
        if fc == 1209
            num = '1';
        elseif fc == 1336
            num = '2';
        elseif fc == 1477
            num = '3';
        elseif fc == 1633
            num = 'A';
        end
    elseif fr == 770
        if fc == 1209
            num = '4';
        elseif fc == 1336
            num = '5';
        elseif fc == 1477
            num = '6';
        elseif fc == 1633
            num = 'B';
        end
    elseif fr == 852
        if fc == 1209
            num = '7';
        elseif fc == 1336
            num = '8';
        elseif fc == 1477
            num = '9';
        elseif fc == 1633
            num = 'C';
        end
    elseif fr == 941
        if fc == 1209
            num = '*';
        elseif fc == 1336
            num = '0';
        elseif fc == 1477
            num = '#';
        elseif fc == 1633
            num = 'D';
        end
    end
end