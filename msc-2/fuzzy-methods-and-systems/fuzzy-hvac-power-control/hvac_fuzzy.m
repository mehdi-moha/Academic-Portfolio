clc;
clear;
close all;

a = newfis('newsys', 'mamdani', 'min', 'max', 'min', 'max', 'centroid');

% Temperature %
a = addvar(a, 'input', 'T', [10, 35]);

% Relative Humidity %
a = addvar(a, 'input', 'RH', [55, 95]);

% Power Dissipation %
a = addvar(a, 'output', 'PD', [1, 4]);

a = addmf(a, 'input', 1, 'Cold', 'gaussmf', [2, 10]);
a = addmf(a, 'input', 1, 'SlightlyCold', 'gaussmf', [2, 16.3]);
a = addmf(a, 'input', 1, 'Neutral', 'gaussmf', [2, 22.5]);
a = addmf(a, 'input', 1, 'SlightlyWarm', 'gaussmf', [2, 28.75]);
a = addmf(a, 'input', 1, 'Warm', 'gaussmf', [2, 35]);

a = addmf(a, 'input', 2, 'LowRH', 'trimf', [39, 55, 71]);
a = addmf(a, 'input', 2, 'MediumRH', 'trimf', [59, 75, 91]);
a = addmf(a, 'input', 2, 'HighRH', 'trimf', [79, 95, 111]);

a = addmf(a, 'output', 1, 'A', 'trimf', [1, 1, 1.9]);
a = addmf(a, 'output', 1, 'B', 'trapmf', [1.5, 1.75, 2.2, 2.35]);
a = addmf(a, 'output', 1, 'C', 'trapmf', [2.05, 2.35, 2.65, 2.95]);
a = addmf(a, 'output', 1, 'D', 'trapmf', [2.65, 2.8, 3.25, 3.5]);
a = addmf(a, 'output', 1, 'E', 'trimf', [3.1, 4, 4]);

RL = [1, 1, 4, 1, 1; ...
    1, 2, 5, 1, 1; ...
    1, 3, 5, 1, 1; ...
    2, 1, 3, 1, 1; ...
    2, 2, 4, 1, 1; ...
    2, 3, 5, 1, 1; ...
    3, 1, 1, 1, 1; ...
    3, 2, 2, 1, 1; ...
    3, 3, 3, 1, 1; ...
    4, 1, 3, 1, 1; ...
    4, 2, 4, 1, 1; ...
    4, 3, 5, 1, 1; ...
    5, 1, 4, 1, 1; ...
    5, 2, 5, 1, 1; ...
    5, 3, 5, 1, 1; ...
    ];

a = addrule(a, RL);

plotfis(a);
surfview(a);

n = 3;
for i = 1:n
    X1 = randi([10, 35]);
    X2 = randi([55, 95]);
    Y = evalfis([X1, X2], a);
    disp(num2str([X1, X2, Y]));
end