%Skyler Szot
%Triangular wave program with varying period

clear all;
close all;

t = -.1:0.01:.1; %initialize t fsamp = 100Hz

i = 0;
figure;
for T=.005*2.^[0:4] %loop through T = 1,2,4,8,16
    N = 10; %10 Fourier Coefficients
    i = i + 1; %iteration counter
    w = (2*pi)/T; %fundamental frequency
    x = 0; %initialize x
    
    for k = 1 :2: N %sum only odd k values, even = 0
    x = x + (4 * (1/T))/(k.^2 * pi.^2)*(2*T*cos(k*w*t)); %ak = (8 * (1/T))/(k.^2 * pi.^2)
    end
    %a0 = 0, so x = x

    subplot(2,3,i);
    plot(t,x) %plot synthesis equation
    title(['T= ',num2str(T)])
    hold on
end