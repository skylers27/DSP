%Skyler Szot
%Square wave program

clear all;
close all;

t = -1:0.01:1; %initialize t
actual = zeros(1,length(t)); %initialize piecewise function storage array

for i = 1:length(t) %initialize piecewise function
    if((t(i)<-.85)||(-.15 < t(i)) && (t(i)< .15)||(t(i)>.85)) 
        actual(i) = 1;
    else
        actual(i) = 0;
    end
end

figure;
i = 0;
for N=10*2.^[0:4] %loop through N = 10,20,40,80,160
    
    i = i + 1; %iteration counter
    T = 1; %period
    w = (2*pi)/T; %fundamental frequency
    x = 0; %initialize x
    
    for k = 1 : N %sum 1 to N
    x = x + (1/T)*(sin(.3*pi*k)/(pi*k))*(2*T*cos(k*w*t)); %ak = (sin(.3*pi*k)/(pi*k))
    end
    x = x + .3; %ak0 = .3


    subplot(2,3,i);
    plot(t, x) %plot synthesis equation
    hold on
    
    plot(t, actual) %plot actual piecewise function
    title(['N= ',num2str(N)])
    hold on
    

    MSE(i) = sum(abs(x - actual).^2)/length(t); %calculate MSE
end

%table
numsamp = {'N10','N20','N40','N80','N160'};
tablevar = {'MSE'};
T = table(MSE(1),MSE(2),MSE(3),MSE(4),MSE(5),'VariableNames',numsamp,'RowNames',tablevar)