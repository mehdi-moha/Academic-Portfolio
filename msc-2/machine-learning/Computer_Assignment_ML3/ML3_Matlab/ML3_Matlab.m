clc;
clear;
close all;

rng(1);

%% 1. Load Data
load fisheriris
X = meas(:, 1:4);
Y = grp2idx(categorical(species)) - 1;  % labels: 0, 1, 2

%% 2. Split Data
cv = cvpartition(Y, 'HoldOut', 0.5);
Xtr_raw = X(training(cv), :);
Xte_raw = X(test(cv), :);
Ytr = Y(training(cv), :);
Yte = Y(test(cv), :);

%% 3. Scaling
mu = mean(Xtr_raw, 1);
sg = std(Xtr_raw, 0, 1);
sg(sg == 0) = 1;

Xtr_scaled = (Xtr_raw - mu) ./ sg;
Xte_scaled = (Xte_raw - mu) ./ sg;

%% 4. Dimensionality Reduction

% --- PCA ---
[coeff, score, ~, ~, ~, mu_pca] = pca(Xtr_scaled);
Xtr_pca = score(:, 1:3);
Xte_pca = (Xte_scaled - mu_pca) * coeff(:, 1:3);

% --- Kernel PCA (RBF) ---
gamma = 1 / size(Xtr_scaled, 2);
sigma = sqrt(1 / (2 * gamma));

[Xtr_kpca, Xte_kpca] = kPCA_train_test(Xtr_scaled, Xte_scaled, 3, sigma);

%% 5. Combine Features
Xtr_final = [Xtr_scaled, Xtr_pca, Xtr_kpca];
Xte_final = [Xte_scaled, Xte_pca, Xte_kpca];

%% 6. Classification

% --- SVM ---
svmMdl = fitcecoc(Xtr_final, Ytr, ...
    'Learners', templateSVM('KernelFunction', 'rbf', 'KernelScale', 'auto'));
pred_tr = predict(svmMdl, Xtr_final);
pred_te = predict(svmMdl, Xte_final);
fprintf('SVM Training MSE: %f\n', mean((Ytr - pred_tr).^2));
fprintf('SVM Test MSE: %f\n', mean((Yte - pred_te).^2));
fprintf('SVM Test Error Rate: %f\n', mean(Yte ~= pred_te));
fprintf('SVM Iterations: -\n\n');

% --- LDA ---
ldaMdl = fitcdiscr(Xtr_final, Ytr, 'DiscrimType', 'pseudoLinear');
pred_tr = predict(ldaMdl, Xtr_final);
pred_te = predict(ldaMdl, Xte_final);
fprintf('LDA Training MSE: %f\n', mean((Ytr - pred_tr).^2));
fprintf('LDA Test MSE: %f\n', mean((Yte - pred_te).^2));
fprintf('LDA Test Error Rate: %f\n', mean(Yte ~= pred_te));
fprintf('LDA Iterations: -\n\n');

% --- Naive Bayes ---
nbMdl = fitcnb(Xtr_final, Ytr);
pred_tr = predict(nbMdl, Xtr_final);
pred_te = predict(nbMdl, Xte_final);
fprintf('Naive Bayes Training MSE: %f\n', mean((Ytr - pred_tr).^2));
fprintf('Naive Bayes Test MSE: %f\n', mean((Yte - pred_te).^2));
fprintf('Naive Bayes Test Error Rate: %f\n', mean(Yte ~= pred_te));
fprintf('Naive Bayes Iterations: -\n\n');

% --- Neural Network ---
Ytr_onehot = full(ind2vec(Ytr' + 1));
rng(1);
net = patternnet([7 3]);
net.trainFcn = 'trainlm';
net.performFcn = 'mse';
net.divideFcn = 'dividetrain';
net.trainParam.epochs = 2000;

net.trainParam.showWindow = false;
net.trainParam.showCommandLine = false;
net.trainParam.show = NaN;

[net, tr] = train(net, Xtr_final', Ytr_onehot);

out_tr = net(Xtr_final');
[~, idx_tr] = max(out_tr, [], 1);
pred_tr = idx_tr' - 1;

out_te = net(Xte_final');
[~, idx_te] = max(out_te, [], 1);
pred_te = idx_te' - 1;

if isfield(tr, 'num_epochs')
    nn_iter = tr.num_epochs;
else
    nn_iter = tr.epoch(end);
end

fprintf('Neural Network Training MSE: %f\n', mean((Ytr - pred_tr).^2));
fprintf('Neural Network Test MSE: %f\n', mean((Yte - pred_te).^2));
fprintf('Neural Network Test Error Rate: %f\n', mean(Yte ~= pred_te));
fprintf('Neural Network Iterations: %d\n\n', nn_iter);

% --- Decision Tree ---
treeMdl = fitctree(Xtr_final, Ytr);
pred_tr = predict(treeMdl, Xtr_final);
pred_te = predict(treeMdl, Xte_final);
fprintf('Decision Trees Training MSE: %f\n', mean((Ytr - pred_tr).^2));
fprintf('Decision Trees Test MSE: %f\n', mean((Yte - pred_te).^2));
fprintf('Decision Trees Test Error Rate: %f\n', mean(Yte ~= pred_te));
fprintf('Decision Trees Iterations: -\n\n');
