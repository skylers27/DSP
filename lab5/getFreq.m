function [fr, fc] = getFreq(x)
    if x == 1
        fr = 697;
        fc = 1209;
    end
    if x == 2
        fr = 697;
        fc = 1336;
    end
    if x == 3
        fr = 697;
        fc = 1477;
    end
    if x == 4
        fr = 941;
        fc = 1209;
    end
    if x == 5
        fr = 941;
        fc = 1336;
    end
    if x == 6
        fr = 941;
        fc = 1477;
    end
    if x == 7
        fr = 852;
        fc = 1209;
    end
    if x == 8
        fr = 852;
        fc = 1336;
    end
    if x == 9
        fr = 852;
        fc = 1477;
    end
    if x == 0
        fr = 941;
        fc = 1336;
    end
    if x == '*'
        fr = 941;
        fc = 1209;
    end
    if x == '#'
        fr = 941;
        fc = 1633;
    end
    if x == 'A'
        fr = 697;
        fc = 1633;
    end
    if x == 'B'
        fr = 770;
        fc = 1633;
    end
    if x == 'C'
        fr = 852;
        fc = 1633;
    end
    if x == 'D'
        fr = 941;
        fc = 1633;
    end
    
end