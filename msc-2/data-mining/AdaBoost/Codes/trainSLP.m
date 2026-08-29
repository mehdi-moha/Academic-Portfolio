function mdl = trainSLP(X, Y)
    X = [-ones(1, size(X, 2)); X];
    mdl.w = Y * pinv(X);
end