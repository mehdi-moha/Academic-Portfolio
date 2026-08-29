clc;
clear;
close all;

data = xlsread('ProjectDatabase.xls');
inputs = data(:, 1:4)';
targets = data(:, 5)';

hiddenLayerSize = 10;
% Feedforward network %
net = feedforwardnet(hiddenLayerSize);

net = configure(net, inputs, targets);

net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'purelin';

net.performFcn = 'mse';

net.divideParam.trainRatio = 60 / 100;
net.divideParam.valRatio = 20 / 100;
net.divideParam.testRatio = 20 / 100;

view(net);

[net, tr] = train(net, inputs, targets);

outputs = sim(net, inputs);
errors = gsubtract(targets, outputs);
performance = perform(net, targets, outputs);

figure;
plotregression(targets(tr.trainInd), outputs(tr.trainInd));
figure;
plotregression(targets(tr.valInd), outputs(tr.valInd));
figure;
plotregression(targets(tr.testInd), outputs(tr.testInd));
figure;
plotregression(targets, outputs);