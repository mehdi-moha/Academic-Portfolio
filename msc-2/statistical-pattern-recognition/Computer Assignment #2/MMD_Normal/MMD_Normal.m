clc
clear

filename = 'Normal-Data-Testing_dat.txt';
formatSpec = '%1s%13s%s%[^\n\r]';
fileID = fopen(filename, 'r');
testData = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'ReturnOnError', false);
fclose(fileID);

datatest = str2num([cell2mat(testData{1}), cell2mat(testData{2}), cell2mat(testData{3})]);
Data = [[datatest(1:500, 1); datatest(501:1000, 1)], [datatest(1:500, 2); datatest(501:1000, 2)], [datatest(1:500, 3); datatest(501:1000, 3)]];
Data = [Data, zeros(numel(Data(:, 1)), 1)];

[rowC1, ~] = find(Data(:, 1) == 1);
[rowC2, ~] = find(Data(:, 1) == 2);
distance = zeros(1, 2);

nTPC11 = 0;
nFNC1 = 0;
nFPC12 = 0;

nTPC22 = 0;
nFNC2 = 0;
nFPC21 = 0;

MeanClass1 = mean([Data(rowC1, 2), Data(rowC1, 3)]);
MeanClass2 = mean([Data(rowC2, 2), Data(rowC2, 3)]);

for i = min(rowC1):max(rowC1)
    MeanClass1_LOO = mean([Data(setdiff(rowC1, i), 2), Data(setdiff(rowC1, i), 3)]);
    DataPoint = [Data(i, 2), Data(i, 3)];

    distance(1, 1) = euclideanDistance(DataPoint, MeanClass1_LOO);
    distance(1, 2) = euclideanDistance(DataPoint, MeanClass2);

    [M, I] = min(distance);
    Data(i, 4) = I;

    if I ~= 1
        nFNC1 = nFNC1 + 1;
        nFPC12 = nFPC12 + 1;
        display('------------------');
        display(['Row Number: ', num2str(i)]);
        display(['Actual Class: ', num2str(Data(i, 1))]);
        display(['Predicted Class: ', num2str(I)]);
        display('------------------');
    end
end
nTPC11 = numel(rowC1) - nFNC1;

for i = min(rowC2):max(rowC2)
    MeanClass2_LOO = mean([Data(setdiff(rowC2, i), 2), Data(setdiff(rowC2, i), 3)]);
    DataPoint = [Data(i, 2), Data(i, 3)];

    distance(1, 1) = euclideanDistance(DataPoint, MeanClass1);
    distance(1, 2) = euclideanDistance(DataPoint, MeanClass2_LOO);

    [M, I] = min(distance);
    Data(i, 4) = I;

    if I ~= 2
        nFNC2 = nFNC2 + 1;
        nFPC21 = nFPC21 + 1;
        display('------------------');
        display(['Row Number: ', num2str(i - max(rowC1))]);
        display(['Actual Class: ', num2str(Data(i, 1))]);
        display(['Predicted Class: ', num2str(I)]);
        display('------------------');
    end
end
nTPC22 = numel(rowC2) - nFNC2;

Confusion_matrix{1, 1} = 'P\A';
Confusion_matrix{2, 1} = 'C1';
Confusion_matrix{3, 1} = 'C2';
Confusion_matrix{1, 2} = 'C1';
Confusion_matrix{1, 3} = 'C2';

Confusion_matrix{2, 2} = nTPC11;
Confusion_matrix{2, 3} = nFPC21;

Confusion_matrix{3, 2} = nFPC12;
Confusion_matrix{3, 3} = nTPC22;

display(Confusion_matrix);