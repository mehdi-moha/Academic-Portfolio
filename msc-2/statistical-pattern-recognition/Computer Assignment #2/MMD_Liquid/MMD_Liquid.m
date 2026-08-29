clc
clear

filename = 'Liquid-Data_dat.txt';
formatSpec = '%4f%13f%8f%8f%8f%8f%f%[^\n\r]';
fileID = fopen(filename, 'r');
LiquidData = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'ReturnOnError', false);
fclose(fileID);

Data = [LiquidData{1}, LiquidData{2}, LiquidData{3}, LiquidData{4}, LiquidData{5}, LiquidData{6}, LiquidData{7}];
Data = [Data, zeros(numel(Data(:, 1)), 1)];

[rowC1, ~] = find(Data(:, 1) == 1);
[rowC2, ~] = find(Data(:, 1) == 2);
[rowC3, ~] = find(Data(:, 1) == 3);
distance = zeros(1, 3);

nTPC11 = 0;
nFNC1 = 0;
nFPC12 = 0;
nFPC13 = 0;

nTPC22 = 0;
nFNC2 = 0;
nFPC21 = 0;
nFPC23 = 0;

nTPC33 = 0;
nFNC3 = 0;
nFPC31 = 0;
nFPC32 = 0;

MeanClass1 = mean([Data(rowC1, 2), Data(rowC1, 3), Data(rowC1, 4), Data(rowC1, 5), Data(rowC1, 6), Data(rowC1, 7)]);
MeanClass2 = mean([Data(rowC2, 2), Data(rowC2, 3), Data(rowC2, 4), Data(rowC2, 5), Data(rowC2, 6), Data(rowC2, 7)]);
MeanClass3 = mean([Data(rowC3, 2), Data(rowC3, 3), Data(rowC3, 4), Data(rowC3, 5), Data(rowC3, 6), Data(rowC3, 7)]);

for i = min(rowC1):max(rowC1)
    MeanClass1_LOO = mean([Data(setdiff(rowC1, i), 2), Data(setdiff(rowC1, i), 3), Data(setdiff(rowC1, i), 4), Data(setdiff(rowC1, i), 5), Data(setdiff(rowC1, i), 6), Data(setdiff(rowC1, i), 7)]);
    DataPoint = [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)];

    distance(1, 1) = euclideanDistance(DataPoint, MeanClass1_LOO);
    distance(1, 2) = euclideanDistance(DataPoint, MeanClass2);
    distance(1, 3) = euclideanDistance(DataPoint, MeanClass3);

    [M, I] = min(distance);
    Data(i, 8) = I;

    if I ~= 1
        nFNC1 = nFNC1 + 1;
        switch I
            case 2
                nFPC12 = nFPC12 + 1;
            case 3
                nFPC13 = nFPC13 + 1;
        end
        display('------------------');
        display(['Row Number: ', num2str(i)]);
        display(['Actual Class: ', num2str(Data(i, 1))]);
        display(['Predicted Class: ', num2str(I)]);
        display('------------------');
    end
end
nTPC11 = numel(rowC1) - nFNC1;

for i = min(rowC2):max(rowC2)
    MeanClass2_LOO = mean([Data(setdiff(rowC2, i), 2), Data(setdiff(rowC2, i), 3), Data(setdiff(rowC2, i), 4), Data(setdiff(rowC2, i), 5), Data(setdiff(rowC2, i), 6), Data(setdiff(rowC2, i), 7)]);
    DataPoint = [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)];

    distance(1, 1) = euclideanDistance(DataPoint, MeanClass1);
    distance(1, 2) = euclideanDistance(DataPoint, MeanClass2_LOO);
    distance(1, 3) = euclideanDistance(DataPoint, MeanClass3);

    [M, I] = min(distance);
    Data(i, 8) = I;

    if I ~= 2
        nFNC2 = nFNC2 + 1;
        switch I
            case 1
                nFPC21 = nFPC21 + 1;
            case 3
                nFPC23 = nFPC23 + 1;
        end
        display('------------------');
        display(['Row Number: ', num2str(i - max(rowC1))]);
        display(['Actual Class: ', num2str(Data(i, 1))]);
        display(['Predicted Class: ', num2str(I)]);
        display('------------------');
    end
end
nTPC22 = numel(rowC2) - nFNC2;

for i = min(rowC3):max(rowC3)
    MeanClass3_LOO = mean([Data(setdiff(rowC3, i), 2), Data(setdiff(rowC3, i), 3), Data(setdiff(rowC3, i), 4), Data(setdiff(rowC3, i), 5), Data(setdiff(rowC3, i), 6), Data(setdiff(rowC3, i), 7)]);
    DataPoint = [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)];

    distance(1, 1) = euclideanDistance(DataPoint, MeanClass1);
    distance(1, 2) = euclideanDistance(DataPoint, MeanClass2);
    distance(1, 3) = euclideanDistance(DataPoint, MeanClass3_LOO);

    [M, I] = min(distance);
    Data(i, 8) = I;

    if I ~= 3
        nFNC3 = nFNC3 + 1;
        switch I
            case 1
                nFPC31 = nFPC31 + 1;
            case 2
                nFPC32 = nFPC32 + 1;
        end
        display('------------------');
        display(['Row Number: ', num2str(i - max(rowC2))]);
        display(['Actual Class: ', num2str(Data(i, 1))]);
        display(['Predicted Class: ', num2str(I)]);
        display('------------------');
    end
end
nTPC33 = numel(rowC3) - nFNC3;

Confusion_matrix{1, 1} = 'P\A';
Confusion_matrix{2, 1} = 'C1';
Confusion_matrix{3, 1} = 'C2';
Confusion_matrix{4, 1} = 'C3';
Confusion_matrix{1, 2} = 'C1';
Confusion_matrix{1, 3} = 'C2';
Confusion_matrix{1, 4} = 'C3';

Confusion_matrix{2, 2} = nTPC11;
Confusion_matrix{2, 3} = nFPC21;
Confusion_matrix{2, 4} = nFPC31;

Confusion_matrix{3, 2} = nFPC12;
Confusion_matrix{3, 3} = nTPC22;
Confusion_matrix{3, 4} = nFPC32;

Confusion_matrix{4, 2} = nFPC13;
Confusion_matrix{4, 3} = nFPC23;
Confusion_matrix{4, 4} = nTPC33;

display(Confusion_matrix);