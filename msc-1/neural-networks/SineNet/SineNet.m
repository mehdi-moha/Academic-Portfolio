clc;
clear;
close all;

a = -1;
b = +1;
Error = a + (b - a) .* rand(1, 100);
x = linspace(0, 2 * pi, 100);
y = sin(x) + Error;

net = feedforwardnet(10);

net.divideParam.trainRatio = 60 / 100;
net.divideParam.valRatio = 20 / 100;
net.divideParam.testRatio = 20 / 100;

net = train(net, x, y);

x0 = pi / 2;
y0 = sim(net, x0);

plot(x, y, '.-r', x0, y0, '*b');
grid on;