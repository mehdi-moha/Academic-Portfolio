clc
clear

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

datatrain = str2num([cell2mat(trainData{1}), cell2mat(trainData{2}), cell2mat(trainData{3})]);
datatest = str2num([cell2mat(testData{1}), cell2mat(testData{2}), cell2mat(testData{3})]);
Data = [[datatrain(1:500, 1); datatest(1:500, 1); datatrain(501:1000, 1); datatest(501:1000, 1)], [datatrain(1:500, 2); datatest(1:500, 2); datatrain(501:1000, 2); datatest(501:1000, 2)], [datatrain(1:500, 3); datatest(1:500, 3); datatrain(501:1000, 3); datatest(501:1000, 3)]];
Data = [Data, zeros(numel(Data(:, 1)), 1)];
D = numel(Data(1, 2:end-1));

[rowC1, ~] = find(Data(:, 1) == 1);
[rowC2, ~] = find(Data(:, 1) == 2);
distance = zeros(max([numel(rowC1), numel(rowC2)]), 2);
distance(:) = inf;

nTPC11 = 0;
nFNC1 = 0;
nFPC12 = 0;

nTPC22 = 0;
nFNC2 = 0;
nFPC21 = 0;

class1 = [Data(rowC1, 2), Data(rowC1, 3)];
class2 = [Data(rowC2, 2), Data(rowC2, 3)];
N1 = numel(class1(:, 1));
N2 = numel(class2(:, 1));

for k = 1:3
    for i = min(rowC1):max(rowC1)
        class1_LOO = [Data(setdiff(rowC1, i), 2), Data(setdiff(rowC1, i), 3)];
        DataPoint = [Data(i, 2), Data(i, 3)];
        for j = 1:numel(class1_LOO(:, 1))
            distance(j + 1, 1) = euclideanDistance(DataPoint, class1_LOO(j, :));
        end
        for j = 1:numel(class2(:, 1))
            distance(j, 2) = euclideanDistance(DataPoint, class2(j, :));
        end
        sortedDistance = sort(distance);
        
        A = sortedDistance(1:k, 1);
        kA = max(numel(find(A(end) == sortedDistance(:, 1))) + numel(find(A(end) ~= A(:))), k);
        B = sortedDistance(1:k, 2);
        kB = max(numel(find(B(end) == sortedDistance(:, 2))) + numel(find(B(end) ~= B(:))), k);
        
        V1 = Vn(D, max(A));
        V2 = Vn(D, max(B));
        N1_LOO = numel(class1_LOO(:, 1));
        
        l12 = (kA * N2 * V2) / (kB * N1_LOO * V1);
        
        pC1 = N1_LOO / (N1_LOO + N2);
        pC2 = N2 / (N1_LOO + N2);
        
        [~, index1] = max([l12, pC2 / pC1]);
        if index1 == 1
            TrueClass = 1;
        else
            TrueClass = 2;
        end
        Data(i, 4) = TrueClass;
        if TrueClass ~= 1
            nFNC1 = nFNC1 + 1;
            nFPC12 = nFPC12 + 1;
            display('------------------');
            display(['Row Number: ', num2str(i)]);
            display(['Actual Class: ', num2str(Data(i, 1))]);
            display(['Predicted Class: ', num2str(TrueClass)]);
            display('------------------');
        end
    end
    nTPC11 = numel(rowC1) - nFNC1;
    
    distance(:) = inf;
    for i = min(rowC2):max(rowC2)
        class2_LOO = [Data(setdiff(rowC2, i), 2), Data(setdiff(rowC2, i), 3)];
        DataPoint = [Data(i, 2), Data(i, 3)];
        for j = 1:numel(class1(:, 1))
            distance(j, 1) = euclideanDistance(DataPoint, class1(j, :));
        end
        for j = 1:numel(class2_LOO(:, 1))
            distance(j + 1, 2) = euclideanDistance(DataPoint, class2_LOO(j, :));
        end
        sortedDistance = sort(distance);
        
        A = sortedDistance(1:k, 1);
        kA = max(numel(find(A(end) == sortedDistance(:, 1))) + numel(find(A(end) ~= A(:))), k);
        B = sortedDistance(1:k, 2);
        kB = max(numel(find(B(end) == sortedDistance(:, 2))) + numel(find(B(end) ~= B(:))), k);
        
        V1 = Vn(D, max(A));
        V2 = Vn(D, max(B));
        N2_LOO = numel(class2_LOO(:, 1));
        
        l12 = (kA * N2_LOO * V2) / (kB * N1 * V1);
        
        pC1 = N1 / (N1 + N2_LOO);
        pC2 = N2_LOO / (N1 + N2_LOO);
        
        [~, index1] = max([l12, pC2 / pC1]);
        if index1 == 1
            TrueClass = 1;
        else
            TrueClass = 2;
        end
        Data(i, 4) = TrueClass;
        if TrueClass ~= 2
            nFNC2 = nFNC2 + 1;
            nFPC21 = nFPC21 + 1;
            display('------------------');
            display(['Row Number: ', num2str(i - max(rowC1))]);
            display(['Actual Class: ', num2str(Data(i, 1))]);
            display(['Predicted Class: ', num2str(TrueClass)]);
            display('------------------');
        end
    end
    nTPC22 = numel(rowC2) - nFNC2;
    
    display(['k = ', num2str(k)]);
    
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
    
    nTPC11 = 0;
    nFNC1 = 0;
    nFPC12 = 0;
    
    nTPC22 = 0;
    nFNC2 = 0;
    nFPC21 = 0;
end