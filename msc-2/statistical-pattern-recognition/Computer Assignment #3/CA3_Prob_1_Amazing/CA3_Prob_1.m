clc
clear
close all
figure
hold on
axis square
xlim([-10, 10]);
ylim([-10, 10]);

filename = 'Data.csv';
delimiter = ',';
startRow = 3;
formatSpec = '%f%f%f%f%f%f%f%f%f%[^\n\r]';

fileID = fopen(filename, 'r');

dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines', startRow-1, 'ReturnOnError', false);

fclose(fileID);

Sample = dataArray{:, 1};
x1 = dataArray{:, 2};
x2 = dataArray{:, 3};
x3 = dataArray{:, 4};
x4 = dataArray{:, 5};
x5 = dataArray{:, 6};
x6 = dataArray{:, 7};
x7 = dataArray{:, 8};
x8 = dataArray{:, 9};

clearvars filename delimiter startRow formatSpec fileID dataArray ans;

s = @(a, b, c, x0, y0)((a * x0 + b * y0 + c) / (a^2 + b^2));
N = numel(Sample);
z = zeros(N, 1);
S = zeros(3, 1);

X = [[x1, x2, z + 1, z + 1, z - 1]', [x3, x4, z + 1, z - 1, z + 1]'];
%X = [[x5, x6, z + 1, z + 1, z - 1]', [x3, x4, z + 1, z - 1, z + 1]'];

w = zeros(3, 1);
Y = {};
c = 0.5;
roh = c;
sNew = roh .* S;
t = 0;
while true
    for i = 1:numel(X(1, :))
        if X(5, i) * w' * X(1:3, i) >= 0
            Y = [Y; i];
        end
    end
    y = cell2mat(Y);
    for j = y(:)'
        S = S + X(5, j) * X(1:3, j);
    end
    if w(1) || w(2)
        cla
        xH = w(1) - w(1) * s(w(1), w(2), w(3), w(1), w(2));
        yH = w(2) - w(2) * s(w(1), w(2), w(3), w(1), w(2));
        drawArrow([xH, wOld(1)], [yH, wOld(2)], [-10, 10], [-10, 10], {'Color', 'm', 'LineWidth', 3.0});
        drawArrow([xH, w(1)], [yH, w(2)], [-10, 10], [-10, 10], {'Color', 'b', 'LineWidth', 1.5});
        drawArrow([xH, -roh .* S(1)], [yH, -roh .* S(2)], [-10, 10], [-10, 10], {'Color', 'k', 'LineWidth', 1.5});
        plot(X(1, 1:10), X(2, 1:10), 'om', 'MarkerFaceColor', 'r');
        plot(X(1, 11:20), X(2, 11:20), 'ob', 'MarkerFaceColor', 'b');
        plt = ezplot([num2str(w(1)), '* x1 +', num2str(w(2)), '* x2 +', num2str(w(3))]);
        set(plt, 'Color', 'red', 'LineWidth', 1.5);
    end
    if isempty(Y)
        disp('Number of Iterations Required for Convergence');
        disp(t)
        break;
    end
    w = w - roh .* S;
    wOld = w;
    w = w ./ norm(w(1:2));
    t = t + 1;
    Y = {};
    S(:) = 0;
    pause(0.25);
    disp(w');
    roh = c / t;
end
