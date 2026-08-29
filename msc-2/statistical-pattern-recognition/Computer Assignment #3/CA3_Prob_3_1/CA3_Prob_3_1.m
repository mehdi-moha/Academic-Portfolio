clc
clear
close all

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

clearvars filename delimiter startRow formatSpec fileID ans;

Data = [ones(10, 1), x1, x2; ones(10, 1), x3, x4; ones(10, 1), x5, x6; ones(10, 1), x7, x8]';

tW = [];
for s = 1:6
    hold on;
    switch s
        case 1
            x = [Data(:, 1:10), Data(:, 11:20)];
            str = 'Class 1 vs Class 2';
        case 2
            x = [Data(:, 1:10), Data(:, 21:30)];
            str = 'Class 1 vs Class 3';
        case 3
            x = [Data(:, 1:10), Data(:, 31:40)];
            str = 'Class 1 vs Class 4';
        case 4
            x = [Data(:, 11:20), Data(:, 21:30)];
            str = 'Class 2 vs Class 3';
        case 5
            x = [Data(:, 11:20), Data(:, 31:40)];
            str = 'Class 2 vs Class 4';
        case 6
            x = [Data(:, 21:30), Data(:, 31:40)];
            str = 'Class 3 vs Class 4';
    end

    fig1 = figure(1);
    axis square
    xlim([-12, 12]);
    ylim([-12, 12]);
    plot(x(2, 1:10), x(3, 1:10), 'or', 'MarkerFaceColor', 'r');
    plot(x(2, 11:20), x(3, 11:20), 'ob', 'MarkerFaceColor', 'b');
    title(str);

    rnd = @(a, b)(a + (b - a) .* rand());
    a = -0.01;
    b = +0.01;
    K = 2;
    d = 2;
    N = 20;
    c = 0.05;
    eta = c;
    w = zeros(K, d+1);
    delta_w = zeros(K, d+1);
    o = zeros(K, 1);
    y = zeros(K, 1);
    r = zeros(K, N);
    Y = zeros(K, N);
    r(1, 1:10) = 1;
    r(2, 11:20) = 1;

    for i = 1:K
        for j = 1:d + 1
            w(i, j) = rnd(a, b);
        end
    end

    iter = 1;
    maxIter = 10000;
    while true
        wOld = w;
        for i = 1:K
            for j = 1:d + 1
                delta_w(i, j) = 0;
            end
        end
        for t = 1:N
            for i = 1:K
                o(i) = 0;
                for j = 1:d + 1
                    o(i) = o(i) + w(i, j) .* x(j, t);
                end
            end
            o = o - max(o);
            for i = 1:K
                y(i) = exp(o(i)) / sum(exp(o(:)));
            end
            for i = 1:K
                for j = 1:d + 1
                    delta_w(i, j) = delta_w(i, j) + (r(i, t) - y(i)) .* x(j, t);
                end
            end
            Y(:, t) = y(:);
        end
        for i = 1:K
            for j = 1:d + 1
                w(i, j) = w(i, j) + eta .* delta_w(i, j);
            end
        end

        wNew = w;
        wb = w(1, :) - w(2, :);

        if norm(wNew(:) - wOld(:), 2) / max(1, norm(wOld(:), 2)) < 1e-6 || iter >= maxIter
            break;
        end
        disp(w);
        iter = iter + 1;
        eta = c / iter;
    end

    plt0 = ezplot([num2str(wb(2)), '* x1 +', num2str(wb(3)), '* x2 +', num2str(wb(1))], [-20, 20]);
    set(plt0, 'Color', 'magenta', 'LineWidth', 1);
    saveas(fig1, ['plot_1_', num2str(s), '.png']);

    fig2 = figure(2);
    e = bar3(Y);
    for k = 1:length(e)
        zdata = e(k).ZData;
        e(k).CData = zdata;
        e(k).FaceColor = 'interp';
    end
    title(str);
    saveas(fig2, ['bar3_1_', num2str(s), '.png']);

    pause(0.25);
    tW = [tW; wb];

    close all;
end

fig3 = figure(3);
hold on;
axis square
xlim([-12, 12]);
ylim([-12, 12]);
plot(Data(2, 1:10), Data(3, 1:10), 'or', 'MarkerFaceColor', 'r');
plot(Data(2, 11:20), Data(3, 11:20), 'og', 'MarkerFaceColor', 'g');
plot(Data(2, 21:30), Data(3, 21:30), 'ob', 'MarkerFaceColor', 'b');
plot(Data(2, 31:40), Data(3, 31:40), 'oc', 'MarkerFaceColor', 'c');
plt1 = ezplot([num2str(tW(1, 2)), '* x1 +', num2str(tW(1, 3)), '* x2 +', num2str(tW(1, 1))], [-12, 12]);
set(plt1, 'Color', 'magenta', 'LineWidth', 1);
plt2 = ezplot([num2str(tW(2, 2)), '* x1 +', num2str(tW(2, 3)), '* x2 +', num2str(tW(2, 1))], [-12, 12]);
set(plt2, 'Color', 'magenta', 'LineWidth', 1);
plt3 = ezplot([num2str(tW(3, 2)), '* x1 +', num2str(tW(3, 3)), '* x2 +', num2str(tW(3, 1))], [-12, 12]);
set(plt3, 'Color', 'magenta', 'LineWidth', 1);
plt4 = ezplot([num2str(tW(4, 2)), '* x1 +', num2str(tW(4, 3)), '* x2 +', num2str(tW(4, 1))], [-12, 12]);
set(plt4, 'Color', 'magenta', 'LineWidth', 1);
plt5 = ezplot([num2str(tW(5, 2)), '* x1 +', num2str(tW(5, 3)), '* x2 +', num2str(tW(5, 1))], [-12, 12]);
set(plt5, 'Color', 'magenta', 'LineWidth', 1);
plt6 = ezplot([num2str(tW(6, 2)), '* x1 +', num2str(tW(6, 3)), '* x2 +', num2str(tW(6, 1))], [-12, 12]);
set(plt6, 'Color', 'magenta', 'LineWidth', 1);
title([]);
saveas(fig3, 'plot_3.png');

pairs = [
    1 2
    1 3
    1 4
    2 3
    2 4
    3 4
];

g = linspace(-12, 12, 300);
[XX, YY] = meshgrid(g, g);
LABEL = zeros(size(XX));

for i = 1:length(g)
    for j = 1:length(g)
        votes = zeros(1, 4);
        
        for s = 1:6
            val = tW(s, 1) + tW(s, 2) * XX(i, j) + tW(s, 3) * YY(i, j);
            
            if val > 0
                votes(pairs(s, 1)) = votes(pairs(s, 1)) + 1;
            else
                votes(pairs(s, 2)) = votes(pairs(s, 2)) + 1;
            end
        end
        
        maxVote = max(votes);
        cnt = 0;
        cls = 0;
        
        for k = 1:4
            if votes(k) == maxVote
                cnt = cnt + 1;
                cls = k;
            end
        end
        
        if cnt == 1
            LABEL(i, j) = cls;
        else
            LABEL(i, j) = 5;
        end
    end
end

fig4 = figure(4);
hold on;
axis square
xlim([-12, 12]);
ylim([-12, 12]);

imagesc(g, g, LABEL);
set(gca, 'YDir', 'normal');

colormap([
    1.0 0.75 0.75
    0.75 1.0 0.75
    0.75 0.75 1.0
    0.75 1.0 1.0
    0.55 0.55 0.55
]);

caxis([1 5]);

for s = 1:6
    plt = ezplot([num2str(tW(s, 2)), '* x1 +', num2str(tW(s, 3)), '* x2 +', num2str(tW(s, 1))], [-12, 12]);
    set(plt, 'Color', 'magenta', 'LineWidth', 1);
end

plot(Data(2,  1:10), Data(3,  1:10), 'or', 'MarkerFaceColor', 'r');
plot(Data(2, 11:20), Data(3, 11:20), 'og', 'MarkerFaceColor', 'g');
plot(Data(2, 21:30), Data(3, 21:30), 'ob', 'MarkerFaceColor', 'b');
plot(Data(2, 31:40), Data(3, 31:40), 'oc', 'MarkerFaceColor', 'c');

title('Ambiguous Regions for Pairwise Classifiers');
saveas(fig4, 'ambiguous_pairwise.png');