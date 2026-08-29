function out = testSLP(mdl, X)
    X = [-ones(1, size(X, 2)); X];
    out = sign(mdl.w*X);
    out(out == 0) = 1;
end