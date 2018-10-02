t = -1:0.01:1;
actual = zeros(1,length(t));

for i = 1:length(t)
    if((t(i)<-.85)||(-.15 <= t(i)) && (t(i)<= .15)||(t(i)>.85))
        actual(i) = 1;
    elseif(abs(t(i))>.15)
        actual(i) = 0;
    end
end

N = 10;
T = 1;
w = (2*pi)/T;
%a = sin(.3*pi*k)/(pi*k);
x = 0;
for k = 1 : N
x = x + (sin(.3*pi*k)/(pi*k))*(2*cos(k*w*t));% + 1i*sin(k*w*t))
end
x = x + .3;


figure;
plot(t,x)
hold on
plot(t, actual)

MSE = sum(abs(x - actual).^2)/length(t)