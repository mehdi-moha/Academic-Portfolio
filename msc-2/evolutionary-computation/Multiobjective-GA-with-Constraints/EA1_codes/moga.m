clc;
clear;
close all;

nvars = 2;
A = [-1, -3; 2, 1];
b = [-3; 10];
lb = [0; 0];
ub = [inf; 6];

fun = @(x)[3 * x(1)^2 + x(2); - 1 * x(1) + 4 * x(2)];
options = gaoptimset('PopulationSize', 100, 'Generations', 50, 'PlotFcns', @gaplotpareto);
[xopt, yopt] = gamultiobj(fun, nvars, A, b, [], [], lb, ub, @nonlcon, options);

figure;
plot(yopt(:, 1), yopt(:, 2), '*');
grid on;
xlabel('1st Objective Function');
ylabel('2nd Objective Function');