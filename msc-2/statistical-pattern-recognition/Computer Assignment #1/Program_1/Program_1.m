clc
clear
close all
hold on

filename = 'Normal-Data-Training_dat.txt';
formatSpec = '%1s%13s%s%[^\n\r]';
fileID = fopen(filename, 'r');
trainData = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'ReturnOnError', false);
fclose(fileID);

filename = 'Normal-Data-Testing_dat.txt';
formatSpec = '%1s%13s%s%[^\n\r]';
fileID = fopen(filename, 'r');
testData = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'ReturnOnError', false);
fclose(fileID);

trData = str2num([cell2mat(trainData{1}), cell2mat(trainData{2}), cell2mat(trainData{3})]);
teData = str2num([cell2mat(testData{1}), cell2mat(testData{2}), cell2mat(testData{3})]);

[rowtr1, ~] = find(trData(:, 1) == 1);
[rowtr2, ~] = find(trData(:, 1) == 2);

[rowte1, ~] = find(teData(:, 1) == 1);
[rowte2, ~] = find(teData(:, 1) == 2);

[eSigma1, em1] = Covariance(trData(rowtr1, 2), trData(rowtr1, 3));
[eSigma2, em2] = Covariance(trData(rowtr2, 2), trData(rowtr2, 3));

plot(trData(rowtr1, 2), trData(rowtr1, 3), 'om');
plot(trData(rowtr2, 2), trData(rowtr2, 3), '+b');

MinXY = min(min(min(trData(rowtr1, 2), trData(rowtr1, 3)), min(min(trData(rowtr2, 2), trData(rowtr2, 3)))));
MaxXY = max(max(max(trData(rowtr1, 2), trData(rowtr1, 3)), max(max(trData(rowtr2, 2), trData(rowtr2, 3)))));
X = MinXY:0.1:MaxXY;
Y = MinXY:0.1:MaxXY;

f1 = zeros(size(X, 1), size(X, 1));
f2 = zeros(size(X, 1), size(X, 1));
p1 = zeros(size(X, 1), size(X, 1));
p2 = zeros(size(X, 1), size(X, 1));

i = 1;
for y = MinXY:0.1:MaxXY
    j = 1;
    for x = MinXY:0.1:MaxXY
        f1(i, j) = mvar(x, y, em1(1), em1(2), eSigma1);
        f2(i, j) = mvar(x, y, em2(1), em2(2), eSigma2);
        p1(i, j) = f1(i, j) / (f1(i, j) + f2(i, j));
        p2(i, j) = f2(i, j) / (f1(i, j) + f2(i, j));
        j = j + 1;
    end
    i = i + 1;
end

contour(MinXY:0.1:MaxXY, MinXY:0.1:MaxXY, f1, 20);
contour(MinXY:0.1:MaxXY, MinXY:0.1:MaxXY, f2, 20);
xlabel('x1');
ylabel('x2');
axis([MinXY, MaxXY, MinXY, MaxXY]);
contour(MinXY:0.1:MaxXY, MinXY:0.1:MaxXY, p1-p2, [0 0]);

Phat_C1 = numel(rowtr1) / (numel(rowtr1) + numel(rowtr2));
Phat_C2 = numel(rowtr2) / (numel(rowtr1) + numel(rowtr2));

g11 = zeros(numel(rowte1), 1);
g12 = zeros(numel(rowte1), 1);
i = 1;

for j = min(rowte1):max(rowte1)
    g11(i) = gi(em1, eSigma1, Phat_C1, [teData(j, 2), teData(j, 3)]);
    g12(i) = gi(em2, eSigma2, Phat_C2, [teData(j, 2), teData(j, 3)]);
    i = i + 1;
end
Pt1 = sum((g11 - g12) > 0 & (teData(rowte1, 1) == 1)) / (numel(teData(rowte1)));
[rowcor1, ~] = find((g11 - g12) > 0);
[rowerr1, ~] = find((g11 - g12) <= 0);
plot(teData(rowcor1, 2), teData(rowcor1, 3), 'sr', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');
plot(teData(rowerr1, 2), teData(rowerr1, 3), 'sg', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g');

g21 = zeros(numel(rowte2), 1);
g22 = zeros(numel(rowte2), 1);
i = 1;
for j = min(rowte2):max(rowte2)
    g21(i) = gi(em1, eSigma1, Phat_C1, [teData(j, 2), teData(j, 3)]);
    g22(i) = gi(em2, eSigma2, Phat_C2, [teData(j, 2), teData(j, 3)]);
    i = i + 1;
end
Pt2 = sum((g22 - g21) > 0 & (teData(rowte2, 1) == 2)) / (numel(teData(rowte2)));
[rowcor2, ~] = find((g22 - g21) > 0);
[rowerr2, ~] = find((g22 - g21) <= 0);
plot(teData(rowcor2+numel(rowte2), 2), teData(rowcor2+numel(rowte2), 3), 'dy', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'y');
plot(teData(rowerr2+numel(rowte2), 2), teData(rowerr2+numel(rowte2), 3), 'dc', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'c');

fprintf('\t--------------------------\n');
fprintf('\t\tWrongly Classified\n');
fprintf('\t--------------------------\n');
disp([teData(rowerr1, :); teData(rowerr2+numel(rowte2), :)]);

fprintf('\t-------------------------\n');
fprintf('\tError Rate Classification\n');
fprintf('\t-------------------------\n');
fprintf('\tClass#1\n');
disp(1-Pt1);
fprintf('\tClass#2\n');
disp(1-Pt2);
fprintf('\tTotal\n');
disp(size([teData(rowerr1, :); teData(rowerr2 + numel(rowte2), :)], 1)/size(teData, 1));