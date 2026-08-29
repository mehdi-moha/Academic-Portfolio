clc;
clear;
close all;

rng(10,'twister');
mu = 0.9;
epoch = 600;

s_xtr = [0, 0; 0, 1; 1, 0; 1, 1];
ytr = [0; 1; 1; 0]';

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

for i = 2:nH+1
    nN{i} = input(['Enter the number of neurons in hidden layer ', num2str(i-1), ': ']);
    eval([Z{i-1}, ' = ones(nN{i}, size(Y0, 2));']);
    eval([Y{i}, ' = ones(nN{i} + 1, size(Y0, 2));']);
end

% nN{end} = input('Enter the number of neurons in the output layer: ');
nN{end} = 1;
eval([Z{end}, ' = ones(nN{end}, size(Y0, 2));']);
eval([Y{end}, ' = ones(nN{end}, size(Y0, 2));']);

for i = 1:nH
    eval([W{i}, ' = randn(size(', Y{i+1}, ', 1) - 1, size(', Y{i}, ', 1));']);
end
eval([W{end}, ' = randn(size(', Y{end}, ', 1), size(', Y{end-1}, ', 1));']);

for i = 1:nH
    eval([dW{i}, ' = zeros(size(', Y{i+1}, ', 1) - 1, size(', Y{i}, ', 1));']);
end
eval([dW{end}, ' = zeros(size(', Y{end}, ', 1), size(', Y{end-1}, ', 1));']);

for i = 1:nH
    eval([t{i}, ' = zeros(size(', Y{i+1}, ', 1) - 1, size(', Y{i}, ', 1));']);
end
eval([t{end}, ' = zeros(size(', Y{end}, ', 1), size(', Y{end-1}, ', 1));']);

Y0(2:end, :) = s_xtr(1:end, :)';

J_vals = zeros(epoch, 1);
Acc_train_vals = zeros(epoch, 1);

figure;
subplot(2,1,1); hold on;
subplot(2,1,2); hold on;

for it = 1:epoch
    for j = 1:numel(Z)-1
        eval([Z{j}, ' = ', W{j}, ' * ', Y{j}, ';']);
        eval([Y{j+1}, '(2:end, :) = sigmoid(', Z{j}, ');']);
    end
    eval([Z{end}, ' = ', W{end}, ' * ', Y{end-1}, ';']);
    eval([Y{end}, ' = sigmoid(', Z{end}, ');']);

    J = eval(['mean(cross_entropy(', Y{end}, ', ytr(:, 1:size(', Y{end}, ', 2))), 2);']);

    eval(['err_', num2str(numel(Z)), ' = d_cross_entropy(', Y{end}, ', ytr(:, 1:size(', Y{end}, ', 2)));']);
    eval(['del_', num2str(numel(Z)), ' = ', 'err_', num2str(numel(Z)), ' .* d_sigmoid(', Z{end}, ');']);

    for j = numel(Z)-1:-1:1
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
        eval([W{j}, ' = ', W{j}, ' - mu .* ', dW{j}, ';']);
    end

    for j = 1:numel(dW)
        eval([dW{j}, ' = zeros(size(', dW{j}, '));']);
    end

    for j = 1:numel(Z)-1
        eval([Z{j}, ' = ', W{j}, ' * ', Y{j}, ';']);
        eval([Y{j+1}, '(2:end, :) = sigmoid(', Z{j}, ');']);
    end
    eval([Z{end}, ' = ', W{end}, ' * ', Y{end-1}, ';']);
    eval([Y{end}, ' = sigmoid(', Z{end}, ');']);

    J = eval(['mean(cross_entropy(', Y{end}, ', ytr(:, 1:size(', Y{end}, ', 2))), 2);']);
    J_vals(it) = J;

    Acc_train_vals(it) = calc_accuracy(eval(Y{end}), ytr);
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

Acc_train = calc_accuracy(eval(Y{end}), ytr);
display(Acc_train);