clc;
clear;
close all;

rng(0,'twister');
mu = 0.5;
epoch = 3000;

filename = 'cardio_dataset.csv';
delimiter = ';';
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename, 'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue', NaN, 'ReturnOnError', false);
fclose(fileID);

age = dataArray{:, 2};
gender = dataArray{:, 3};
height = dataArray{:, 4};
weight = dataArray{:, 5};
ap_hi = dataArray{:, 6};
ap_lo = dataArray{:, 7};
chol = dataArray{:, 8};
gluc = dataArray{:, 9};
smoke = dataArray{:, 10};
alco = dataArray{:, 11};
active = dataArray{:, 12};
target = dataArray{:, 13};

valid_idx = (ap_hi > 0) & (ap_hi < 250) & (ap_lo > 0) & (ap_lo < 200) & (ap_hi > ap_lo) & (height > 100) & (height < 250) & (weight > 30) & (weight < 200);

age = age(valid_idx);
gender = gender(valid_idx);
height = height(valid_idx);
weight = weight(valid_idx);
ap_hi = ap_hi(valid_idx);
ap_lo = ap_lo(valid_idx);
chol = chol(valid_idx);
gluc = gluc(valid_idx);
smoke = smoke(valid_idx);
alco = alco(valid_idx);
active = active(valid_idx);
target = target(valid_idx);

chol_1 = (chol == 1);
chol_2 = (chol == 2);
chol_3 = (chol == 3);

gluc_1 = (gluc == 1);
gluc_2 = (gluc == 2);
gluc_3 = (gluc == 3);

x = [age, gender-1, height, weight, ap_hi, ap_lo, smoke, alco, active, chol_1, chol_2, chol_3, gluc_1, gluc_2, gluc_3];
d = target;

P = 0.75;

i0 = find(d == 0);
i1 = find(d == 1);

i0 = i0(randperm(length(i0)));
i1 = i1(randperm(length(i1)));

N0_tr = round(P * length(i0));
N1_tr = round(P * length(i1));

idx_tr = [i0(1:N0_tr); i1(1:N1_tr)];
idx_te = [i0(N0_tr+1:end); i1(N1_tr+1:end)];

xtr = x(idx_tr, :);
ytr = d(idx_tr, :)';

xte = x(idx_te, :);
yte = d(idx_te, :)';

fprintf('Train: total=%d -> class0=%d, class1=%d\n', length(idx_tr), sum(ytr==0), sum(ytr==1));
fprintf('Test:  total=%d -> class0=%d, class1=%d\n', length(idx_te), sum(yte==0), sum(yte==1));

fprintf('Train class0 ratio = %.2f%%\n', 100*sum(ytr==0)/length(i0));
fprintf('Train class1 ratio = %.2f%%\n', 100*sum(ytr==1)/length(i1));

min_xtr = min(xtr, [], 1);
max_xtr = max(xtr, [], 1);
s_xtr = (xtr - repmat(min_xtr, size(xtr, 1), 1)) ./ (repmat(max_xtr, size(xtr, 1), 1) - repmat(min_xtr, size(xtr, 1), 1));

nH = input('Enter the number of hidden layers: ');

Z = strrep(matlab.lang.makeUniqueStrings(repmat({'Z'}, 1, nH+1), 'Z'), '_', '');
W = strrep(matlab.lang.makeUniqueStrings(repmat({'W'}, 1, nH+1), 'W'), '_', '');
dW = strrep(matlab.lang.makeUniqueStrings(repmat({'dW'}, 1, nH+1), 'dW'), '_', '');
t = strrep(matlab.lang.makeUniqueStrings(repmat({'t'}, 1, nH+1), 't'), '_', '');

Y{1} = 'Y0';
Y = [Y, strrep(matlab.lang.makeUniqueStrings(repmat({'Y'}, 1, nH), 'Y'), '_', '')];
Y{nH+2} = ['Y', num2str(nH+1)];

nN = cell(1, nH+2);
nN{1} = size(s_xtr', 1);
eval([Y{1}, ' = ones(nN{1} + 1, ', num2str(size(s_xtr(1:end, :)', 2)), ');']);

for i = 2:nH + 1
    nN{i} = input(['Enter the number of neurons in hidden layer ', num2str(i - 1), ': ']);
    eval([Z{i - 1}, ' = ones(nN{i}, size(Y0, 2));']);
    eval([Y{i}, ' = ones(nN{i} + 1, size(Y0, 2));']);
end

% nN{end} = input('Enter the number of neurons in the output layer: ');
nN{end} = 1;
eval([Z{end}, ' = ones(nN{end}, size(Y0, 2));']);
eval([Y{end}, ' = ones(nN{end}, size(Y0, 2));']);

for i = 1:nH
    eval([W{i}, '= randn(size(', Y{i + 1}, ', 1) - 1, size(', Y{i}, ', 1));']);
end
eval([W{end}, '= randn(size(', Y{end}, ', 1), size(', Y{end-1}, ', 1));']);

for i = 1:nH
    eval([dW{i}, '= zeros(size(', Y{i + 1}, ', 1) - 1, size(', Y{i}, ', 1));']);
end
eval([dW{end}, '= zeros(size(', Y{end}, ', 1), size(', Y{end-1}, ', 1));']);

for i = 1:nH
    eval([t{i}, '= zeros(size(', Y{i + 1}, ', 1) - 1, size(', Y{i}, ', 1));']);
end
eval([t{end}, '= zeros(size(', Y{end}, ', 1), size(', Y{end-1}, ', 1));']);

Y0(2:end, :) = s_xtr(1:end, :)';

J_vals = zeros(epoch,1);
Acc_train_vals = zeros(epoch,1);

figure;
subplot(2,1,1);
hold on;
subplot(2,1,2);
hold on;

for i = 1:epoch
    for j = 1:numel(Z) - 1
        eval([Z{j}, ' = ', W{j}, ' * ', Y{j}, ';']);
        eval([Y{j+1}, '(2:end, :) = sigmoid(', Z{j}, ');']);
    end
    eval([Z{end}, ' = ', W{end}, ' * ', Y{end-1}, ';']);
    eval([Y{end}, ' = sigmoid(', Z{end}, ');']);

    eval(['err_', num2str(numel(Z)), ' = d_cross_entropy(', Y{end}, ', ytr(:, 1:size(', Y{end}, ', 2)));']);
    eval(['del_', num2str(numel(Z)), ' = ', 'err_', num2str(numel(Z)), ' .* d_sigmoid(', Z{end}, ');']);

    for j = numel(Z) - 1:-1:1
        eval(['err_', num2str(j), ' = ', W{j+1}, '(:, 2:end)'' * ', 'del_', num2str(j+1), ';']);
        eval(['del_', num2str(j), ' = ', 'err_', num2str(j), ' .* d_sigmoid(', Z{j}, ');']);
    end

    for j = 1:numel(dW)
        for k = 1:size(eval(Y{j}), 1)
            eval([t{j}, '(:, ', num2str(k), ') = mean(repmat(', Y{j}, '(', num2str(k), ', :), size(del_', num2str(j), ', 1), 1) .* del_', num2str(j), ', 2);']);
        end
        eval([dW{j}, ' = ', dW{j}, ' + ', t{j}, ';']);
    end

    for j = 1:numel(W)
        eval([W{j}, ' = ', W{j}, ' - mu .* ', dW{j}, ';'])
    end
    
    for j = 1:numel(dW)
        eval([dW{j}, ' = zeros(size(', dW{j}, '));']);
    end

    for j = 1:numel(Z) - 1
        eval([Z{j}, ' = ', W{j}, ' * ', Y{j}, ';']);
        eval([Y{j+1}, '(2:end, :) = sigmoid(', Z{j}, ');']);
    end
    eval([Z{end}, ' = ', W{end}, ' * ', Y{end-1}, ';']);
    eval([Y{end}, ' = sigmoid(', Z{end}, ');']);

    J = eval(['mean(cross_entropy(', Y{end}, ', ytr(:, 1:size(', Y{end}, ', 2))), 2);']);
    J_vals(i) = J;
    
    [~, ~, ~, ~, Acc_train_vals(i)] = calc_metrics(eval(Y{end}), ytr);
    disp(['Iter ', num2str(i), '   J = ', num2str(J), '   Acc_train = ', num2str(Acc_train_vals(i)*100), ' %']);

    subplot(2,1,1);
    plot(i, J, 'or', 'MarkerSize', 1, 'MarkerFaceColor', 'r');
    xlabel('Iteration');
    ylabel('J');
    title(['J = ', num2str(J)]);
    axis([1, epoch, 0, 1.2]);

    subplot(2,1,2);
    plot(i, Acc_train_vals(i)*100, 'ob', 'MarkerSize', 1, 'MarkerFaceColor', 'b');
    xlabel('Iteration');
    ylabel('Accuracy (%)');
    title(['Accuracy = ', num2str(Acc_train_vals(i)*100)]);
    axis([1, epoch, 0, 100]);

    pause(eps);
end

[TP, TN, FP, FN, Acc_train] = calc_metrics(eval(Y{end}), ytr);
C_train = [TP  FP;
           FN  TN];
display(Acc_train);
disp('Confusion matrix (Train) = ');
disp(C_train);

s_xte = (xte - repmat(min_xtr, size(xte, 1), 1)) ./ (repmat(max_xtr, size(xte, 1), 1) - repmat(min_xtr, size(xte, 1), 1));
nN{1} = size(s_xte', 1);
eval([Y{1}, ' = ones(nN{1} + 1, ', num2str(size(s_xte(1:end, :)', 2)), ');']);

for i = 2:nH + 1
    eval([Z{i - 1}, ' = ones(nN{i}, size(Y0, 2));']);
    eval([Y{i}, ' = ones(nN{i} + 1, size(Y0, 2));']);
end

eval([Z{end}, ' = ones(nN{end}, size(Y0, 2));']);
eval([Y{end}, ' = ones(nN{end}, size(Y0, 2));']);

Y0(2:end, :) = s_xte(1:end, :)';
for j = 1:numel(Z) - 1
    eval([Z{j}, ' = ', W{j}, ' * ', Y{j}, ';']);
    eval([Y{j+1}, '(2:end, :) = sigmoid(', Z{j}, ');']);
end
eval([Z{end}, ' = ', W{end}, ' * ', Y{end-1}, ';']);
eval([Y{end}, ' = sigmoid(', Z{end}, ');']);

[TP, TN, FP, FN, Acc_test] = calc_metrics(eval(Y{end}), yte);
C_test = [TP  FP;
          FN  TN];
display(Acc_test);
disp('Confusion matrix (Test) = ');
disp(C_test);