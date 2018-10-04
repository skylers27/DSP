%Skyler Szot
%Triangular wave program

clear all;
close all;

t = -2:0.01:2; %initialize t

actual = zeros(1,length(t)); %initialize piecewise function storage array

for i = 1:length(t) %initialize piecewise function
    if(t(i)<-1)
        actual(i) = (-2 * t(i))-3;
    elseif(-1<=t(i) && t(i)<0)
        actual(i) = (2*t(i)+1);
    elseif(0<=t(i) && t(i)<1)
        actual(i) = (-2*t(i)+1);
    elseif(1<=t(i))
        actual(i) = (2*t(i)-3);
    end
end

i = 0;
figure;
for N=10*2.^[0:4] %loop through N = 10,20,40,80,160
    
    i = i + 1; %iteration counter
    T = 2; %period
    w = (2*pi)/T; %fundamental frequency
    x = 0; %initialize x
    
    for k = 1 :2: N %sum only odd k values, even = 0
    x = x + (4 * (1/T))/(k.^2 * pi.^2)*(2*T*cos(k*w*t)); %ak = (8 * (1/T))/(k.^2 * pi.^2)
    end
    %a0 = 0, so x = x

    subplot(2,3,i);
    plot(t,x) %plot synthesis equation
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