clc;
clear;
close all;

rng(10,'twister');
mu = 0.9;
epoch = 600;

s_xtr = [0, 0; 0, 1; 1, 0; 1, 1];
ytr = [0; 1; 1; 0]';

nH = input('Enter the number of hidden layers: ');

Z = cell(1, nH+1);
W = cell(1, nH+1);
dW = cell(1, nH+1);
t = cell(1, nH+1);
Y = cell(1, nH+2);
nN = cell(1, nH+2);

nN{1} = size(s_xtr', 1);
Y{1} = ones(nN{1} + 1, size(s_xtr(1:end, :)', 2));

for i = 2:nH+1
    nN{i} = input(['Enter the number of neurons in hidden layer ', num2str(i-1), ': ']);
    Z{i-1} = ones(nN{i}, size(Y{1}, 2));
    Y{i} = ones(nN{i} + 1, size(Y{1}, 2));
end

% nN{end} = input('Enter the number of neurons in the output layer: ');
nN{end} = 1;
Z{end} = ones(nN{end}, size(Y{1}, 2));
Y{end} = ones(nN{end}, size(Y{1}, 2));

for i = 1:nH
    W{i} = randn(size(Y{i+1}, 1) - 1, size(Y{i}, 1));
end
W{end} = randn(size(Y{end}, 1), size(Y{end-1}, 1));

for i = 1:nH
    dW{i} = zeros(size(Y{i+1}, 1) - 1, size(Y{i}, 1));
end
dW{end} = zeros(size(Y{end}, 1), size(Y{end-1}, 1));

for i = 1:nH
    t{i} = zeros(size(Y{i+1}, 1) - 1, size(Y{i}, 1));
end
t{end} = zeros(size(Y{end}, 1), size(Y{end-1}, 1));

Y{1}(2:end, :) = s_xtr(1:end, :)';

J_vals = zeros(epoch, 1);
Acc_train_vals = zeros(epoch, 1);

figure;
subplot(2,1,1); hold on;
subplot(2,1,2); hold on;

for it = 1:epoch
    for j = 1:numel(Z)-1
        Z{j} = W{j} * Y{j};
        Y{j+1}(2:end, :) = sigmoid(Z{j});
    end
    Z{end} = W{end} * Y{end-1};
    Y{end} = sigmoid(Z{end});

    err_last = d_cross_entropy(Y{end}, ytr(:, 1:size(Y{end}, 2)));
    del_last = err_last .* d_sigmoid(Z{end});

    del = cell(1, numel(Z));
    del{end} = del_last;

    for j = numel(Z)-1:-1:1
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

    for j = 1:numel(Z)-1
        Z{j} = W{j} * Y{j};
        Y{j+1}(2:end, :) = sigmoid(Z{j});
    end
    Z{end} = W{end} * Y{end-1};
    Y{end} = sigmoid(Z{end});

    J = mean(cross_entropy(Y{end}, ytr(:, 1:size(Y{end}, 2))), 2);
    J_vals(it) = J;

    Acc_train_vals(it) = calc_accuracy(Y{end}, ytr);
    disp(['Iter ', num2str(it), '   J = ', num2str(J), '   Acc_train = ', num2str(Acc_train_vals(it)*100), ' %']);

    subplot(2,1,1);
    plot(it, J, 'or', 'MarkerSize', 1, 'MarkerFaceColor', 'r');
    xlabel('Iteration');
    ylabel('J');
    title(['J = ', num2str(J)]);
    axis([1, epoch, 0, 1.2]);

    subplot(2,1,2);
    plot(it, Acc_train_vals(it)*100, 'ob', 'MarkerSize', 1, 'MarkerFaceColor', 'b');
    xlabel('Iteration');
    ylabel('Accuracy (%)');
    title(['Accuracy = ', num2str(Acc_train_vals(it)*100)]);
    axis([1, epoch, 0, 100]);

    pause(eps);
end

Acc_train = calc_accuracy(Y{end}, ytr);
display(Acc_train);