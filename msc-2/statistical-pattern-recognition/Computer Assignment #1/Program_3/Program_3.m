clc
clear
close all

filename = 'Liquid-Data_dat.txt';
formatSpec = '%4f%13f%8f%8f%8f%8f%f%[^\n\r]';
fileID = fopen(filename, 'r');
LiquidData = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'ReturnOnError', false);
fclose(fileID);

Data = [LiquidData{1}, LiquidData{2}, LiquidData{3}, LiquidData{4}, LiquidData{5}, LiquidData{6}, LiquidData{7}];

[rowC1, ~] = find(Data(:, 1) == 1);
[rowC2, ~] = find(Data(:, 1) == 2);
[rowC3, ~] = find(Data(:, 1) == 3);

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

[eSigma1, em1] = Covariance(Data(rowC1, 2), Data(rowC1, 3), Data(rowC1, 4), Data(rowC1, 5), Data(rowC1, 6), Data(rowC1, 7));
[eSigma2, em2] = Covariance(Data(rowC2, 2), Data(rowC2, 3), Data(rowC2, 4), Data(rowC2, 5), Data(rowC2, 6), Data(rowC2, 7));
[eSigma3, em3] = Covariance(Data(rowC3, 2), Data(rowC3, 3), Data(rowC3, 4), Data(rowC3, 5), Data(rowC3, 6), Data(rowC3, 7));

N1 = numel(rowC1);
N2 = numel(rowC2);
N3 = numel(rowC3);

for i = min(rowC1):max(rowC1)
    [eSigma1_LOO, em1_LOO] = Covariance(Data(setdiff(rowC1, i), 2), Data(setdiff(rowC1, i), 3), Data(setdiff(rowC1, i), 4), Data(setdiff(rowC1, i), 5), Data(setdiff(rowC1, i), 6), Data(setdiff(rowC1, i), 7));
    N1_LOO = numel(setdiff(rowC1, i));
    
    Phat_C1 = N1_LOO / (N1_LOO + N2 + N3);
    Phat_C2 = N2 / (N1_LOO + N2 + N3);
    Phat_C3 = N3 / (N1_LOO + N2 + N3);

    g11 = gi(em1_LOO, eSigma1_LOO, Phat_C1, [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)]);
    g12 = gi(em2, eSigma2, Phat_C2, [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)]);
    g13 = gi(em3, eSigma3, Phat_C3, [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)]);

    g = [{'g11'}, {'g12'}, {'g13'}];

    [M, I] = max([g11, g12, g13]);
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
        display([g{1}, ' = ', num2str(g11)]);
        display([g{I}, ' = ', num2str(M)]);
        display('------------------');
    end
end
nTPC11 = N1 - nFNC1;

for i = min(rowC2):max(rowC2)
    [eSigma2_LOO, em2_LOO] = Covariance(Data(setdiff(rowC2, i), 2), Data(setdiff(rowC2, i), 3), Data(setdiff(rowC2, i), 4), Data(setdiff(rowC2, i), 5), Data(setdiff(rowC2, i), 6), Data(setdiff(rowC2, i), 7));
    N2_LOO = numel(setdiff(rowC2, i));

    Phat_C1 = N1 / (N1 + N2_LOO + N3);
    Phat_C2 = N2_LOO / (N1 + N2_LOO + N3);
    Phat_C3 = N3 / (N1 + N2_LOO + N3);

    g21 = gi(em1, eSigma1, Phat_C1, [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)]);
    g22 = gi(em2_LOO, eSigma2_LOO, Phat_C2, [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)]);
    g23 = gi(em3, eSigma3, Phat_C3, [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)]);

    g = [{'g21'}, {'g22'}, {'g23'}];

    [M, I] = max([g21, g22, g23]);
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
        display([g{2}, ' = ', num2str(g22)]);
        display([g{I}, ' = ', num2str(M)]);
        display('------------------');
    end
end
nTPC22 = N2 - nFNC2;

for i = min(rowC3):max(rowC3)
    [eSigma3_LOO, em3_LOO] = Covariance(Data(setdiff(rowC3, i), 2), Data(setdiff(rowC3, i), 3), Data(setdiff(rowC3, i), 4), Data(setdiff(rowC3, i), 5), Data(setdiff(rowC3, i), 6), Data(setdiff(rowC3, i), 7));
    N3_LOO = numel(setdiff(rowC3, i));

    Phat_C1 = N1 / (N1 + N2 + N3_LOO);
    Phat_C2 = N2 / (N1 + N2 + N3_LOO);
    Phat_C3 = N3_LOO / (N1 + N2 + N3_LOO);

    g31 = gi(em1, eSigma1, Phat_C1, [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)]);
    g32 = gi(em2, eSigma2, Phat_C2, [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)]);
    g33 = gi(em3_LOO, eSigma3_LOO, Phat_C3, [Data(i, 2), Data(i, 3), Data(i, 4), Data(i, 5), Data(i, 6), Data(i, 7)]);

    g = [{'g31'}, {'g32'}, {'g33'}];

    [M, I] = max([g31, g32, g33]);
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
        display([g{3}, ' = ', num2str(g33)]);
        display([g{I}, ' = ', num2str(M)]);
        display('------------------');
    end
end
nTPC33 = N3 - nFNC3;

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
