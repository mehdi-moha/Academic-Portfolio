clc;
clear;
close all;

threshold = 5.99;

fID = fopen('Iris.txt');
fData = textscan(fID, '%f, %f, %f, %f, %s');
fclose(fID);
a = cell2mat(fData(1, 1));
b = cell2mat(fData(1, 2));
p = cell2mat(fData(1, 3));
q = cell2mat(fData(1, 4));
classLabels = fData{1, 5};

[row, ~] = size(classLabels);
c = zeros(row, 1);
for i = 1:row
    if strcmp(classLabels(i, 1), 'Iris-setosa') == 1
        c(i, 1) = 1;
    elseif strcmp(classLabels(i, 1), 'Iris-versicolor') == 1
        c(i, 1) = 2;
    elseif strcmp(classLabels(i, 1), 'Iris-virginica') == 1
        c(i, 1) = 3;
    end
end

for col = 1:4

    data = [sortrows([a, b, p, q, c], col), (1:numel(a(:, 1)))'];

    uniqueValue = unique(data(:, col));
    for i = 1:numel(uniqueValue(:, 1))
        dataIndex = find(uniqueValue(i) == data(:, col));
        data(dataIndex, 6) = i;
    end

    tbl.Set = [];
    t = repmat(tbl, [numel(uniqueValue(:, 1)), 1]);

    for it = 1:100

        UniqueInterval = unique(data(:, 6));

        if numel(UniqueInterval(:, 1)) == 6
            break;
        end

        UniqueInterval = [UniqueInterval, zeros(numel(UniqueInterval(:, 1)), 1)];
        A = zeros(numel(UniqueInterval(:, 1)), 3);
        test = zeros(numel(UniqueInterval(:, 1))-1, 1);
        for i = 1:numel(UniqueInterval(:, 1)) - 1
            for j = i:i + 1
                for k = 1:3
                    A(j, k) = sum(data(find(UniqueInterval(j, 1) == data(:, 6)), 5) == k);
                end
            end
            C1 = sum(A(i:i+1, 1));
            C2 = sum(A(i:i+1, 2));
            C3 = sum(A(i:i+1, 3));
            R1 = sum(A(i, :));
            R2 = sum(A(i+1, :));

            E11 = (R1 * [C1, C2, C3]) ./ sum([C1, C2, C3]);
            index = find(E11 == 0);
            E11((index)) = 0.1;

            E21 = (R2 * [C1, C2, C3]) ./ sum([C1, C2, C3]);
            index = find(E21 == 0);
            E21((index)) = 0.1;

            UniqueInterval(i, 2) = sum(sum(((A(i:i+1, :) - [E11; E21]).^2)./[E11; E21]));
        end

        if min(UniqueInterval(1:numel(UniqueInterval(:, 1))-1, 2)) < threshold
            test = UniqueInterval(1:numel(UniqueInterval(:, 1))-1, 2) == min(UniqueInterval(1:numel(UniqueInterval(:, 1))-1, 2));
        end

        j = 1;
        t(j).Set = [t(j).Set, 1];
        for i = 1:numel(test(:))
            if test(i) == 1
                t(j).Set = [t(j).Set, i + 1];
            else
                j = j + 1;
                t(j).Set = [t(j).Set, i + 1];
            end
        end

        for i = 1:numel(t)
            if ~isempty(t(i).Set)
                for j = 1:numel(t(i).Set)
                    [I, J] = find(t(i).Set(j) == data(:, 6));
                    data(I, 6) = i;
                end
            end
        end

        for i = 1:numel(t)
            t(i).Set = [];
        end
    end

    g = zeros(numel(unique(data(:, 6))), 2);
    for i = 1:numel(unique(data(:, 6)))
        g(i, 1) = min(data(find(data(:, 6) == i), col));
        g(i, 2) = max(data(find(data(:, 6) == i), col));
    end

    display('------------------------------');

    switch col
        case 1
            disp('Grouping based on Sepal Length');
            disp('------------------------------');
        case 2
            disp('Grouping based on Sepal Width');
            disp('------------------------------');
        case 3
            disp('Grouping based on Petal Length');
            disp('------------------------------');
        case 4
            disp('Grouping based on Petal Width');
            disp('------------------------------');
    end
    disp(g);
end
