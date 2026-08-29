clc
clear
close all
hold on

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

N = numel(Sample);
z = zeros(N, 1);
S = zeros(3, 1);

X = [[x1, x2, z + 1]', [x3, x4, z + 1]']';
%X = [[x5, x6, z + 1]', [x3, x4, z + 1]']';
y = [(z + 1)', (z - 1)']';

w = (X' * X) \ (X' * y);
plot(X(1:10, 1), X(1:10, 2), 'mo', 'MarkerFaceColor', 'r');
plot(X(11:20, 1), X(11:20, 2), 'bo', 'MarkerFaceColor', 'b');
plt = ezplot([num2str(w(1)), '* x1 +', num2str(w(2)), '* x2 +', num2str(w(3))]);
set(plt, 'Color', 'magenta', 'LineWidth', 2)