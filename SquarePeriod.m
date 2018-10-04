%Skyler Szot
%Square wave program with varying period

clear all;
close all;

t = -.1:0.01:.1; %initialize t

figure;
i = 0;
for T=.005*2.^[0:4] %loop through T = 1,2,4,8,16
    N = 10; %10 Fourier Coefficients
    i = i + 1; %iteration counter
    w = (2*pi)/T; %fundamental frequency
    x = 0; %initialize x
    
    for k = 1 : N %sum 1 to N
    x = x + (1/T)*(sin(.3*pi*k)/(pi*k))*(2*T*cos(k*w*t)); %ak = (sin(.3*pi*k)/(pi*k))
    end
    x = x + .3; %ak0 = .3

    subplot(2,3,i);
    plot(t, x) %plot synthesis equation
    hold on
    title(['T= ',num2str(T)])
end
