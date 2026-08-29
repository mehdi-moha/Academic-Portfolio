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

Z = cell(1, nH+1);
W = cell(1, nH+1);
dW = cell(1, nH+1);
t = cell(1, nH+1);
Y = cell(1, nH+2);

nN = cell(1, nH+2);
nN{1} = size(s_xtr', 1);
Y{1} = ones(nN{1} + 1, size(s_xtr(1:end, :)', 2));

for i = 2:nH + 1
    nN{i} = input(['Enter the number of neurons in hidden layer ', num2str(i - 1), ': ']);
    Z{i - 1} = ones(nN{i}, size(Y{1}, 2));
    Y{i} = ones(nN{i} + 1, size(Y{1}, 2));
end

% nN{end} = input('Enter the number of neurons in the output layer: ');
nN{end} = 1;
Z{end} = ones(nN{end}, size(Y{1}, 2));
Y{end} = ones(nN{end}, size(Y{1}, 2));

for i = 1:nH
    W{i} = randn(size(Y{i + 1}, 1) - 1, size(Y{i}, 1));
end
W{end} = randn(size(Y{end}, 1), size(Y{end-1}, 1));

for i = 1:nH
    dW{i} = zeros(size(Y{i + 1}, 1) - 1, size(Y{i}, 1));
end
dW{end} = zeros(size(Y{end}, 1), size(Y{end-1}, 1));

for i = 1:nH
    t{i} = zeros(size(Y{i + 1}, 1) - 1, size(Y{i}, 1));
end
t{end} = zeros(size(Y{end}, 1), size(Y{end-1}, 1));

Y{1}(2:end, :) = s_xtr(1:end, :)';

J_vals = zeros(epoch,1);
Acc_train_vals = zeros(epoch,1);

figure;
subplot(2,1,1);
hold on;
subplot(2,1,2);
hold on;

for i = 1:epoch
    for j = 1:numel(Z) - 1
        Z{j} = W{j} * Y{j};
        Y{j+1}(2:end, :) = sigmoid(Z{j});
    end
    Z{end} = W{end} * Y{end-1};
    Y{end} = sigmoid(Z{end});

    err_last = d_cross_entropy(Y{end}, ytr(:, 1:size(Y{end}, 2)));
    del_last = err_last .* d_sigmoid(Z{end});

    del = cell(1, numel(Z));
    del{end} = del_last;

    for j = numel(Z) - 1:-1:1
        err_j = W{j+1}(:, 2:end)' * del{j+1};
        del{j} = err_j .* d_sigmoid(Z{j});
    end

    for j = 1:numel(dW)
        for k = 1:size(Y{j}, 1)
            t{j}(:, k) = mean(repmat(Y{j}(k, :), size(del{j}, 1), 1) .* del{j}, 2);
        end
        dW{j} = dW{j} + t{j};
    end

    for j = 1:numel(W)
        W{j} = W{j} - mu .* dW{j};
    end
    
    for j = 1:numel(dW)
        dW{j} = zeros(size(dW{j}));
    end

    for j = 1:numel(Z) - 1
        Z{j} = W{j} * Y{j};
        Y{j+1}(2:end, :) = sigmoid(Z{j});
    end
    Z{end} = W{end} * Y{end-1};
    Y{end} = sigmoid(Z{end});

    J = mean(cross_entropy(Y{end}, ytr(:, 1:size(Y{end}, 2))), 2);
    J_vals(i) = J;
    
    [~, ~, ~, ~, Acc_train_vals(i)] = calc_metrics(Y{end}, ytr);
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

[TP, TN, FP, FN, Acc_train] = calc_metrics(Y{end}, ytr);
C_train = [TP  FP;
           FN  TN];
display(Acc_train);
disp('Confusion matrix (Train) = ');
disp(C_train);

s_xte = (xte - repmat(min_xtr, size(xte, 1), 1)) ./ (repmat(max_xtr, size(xte, 1), 1) - repmat(min_xtr, size(xte, 1), 1));
nN{1} = size(s_xte', 1);
Y{1} = ones(nN{1} + 1, size(s_xte(1:end, :)', 2));

for i = 2:nH + 1
    Z{i - 1} = ones(nN{i}, size(Y{1}, 2));
    Y{i} = ones(nN{i} + 1, size(Y{1}, 2));
end

Z{end} = ones(nN{end}, size(Y{1}, 2));
Y{end} = ones(nN{end}, size(Y{1}, 2));

Y{1}(2:end, :) = s_xte(1:end, :)';
for j = 1:numel(Z) - 1
    Z{j} = W{j} * Y{j};
    Y{j+1}(2:end, :) = sigmoid(Z{j});
end
Z{end} = W{end} * Y{end-1};
Y{end} = sigmoid(Z{end});

[TP, TN, FP, FN, Acc_test] = calc_metrics(Y{end}, yte);
C_test = [TP  FP;
          FN  TN];
display(Acc_test);
disp('Confusion matrix (Test) = ');
disp(C_test);