function [C, m] = Covariance(W, X, Y, Z)
V = [W, X, Y, Z];
[r, ~] = size(V);
m = [sum(W) / r, sum(X) / r,  sum(Y) / r,  sum(Z) / r];
mu = repmat(m, r, 1);
C = ((V - mu)' * (V - mu)) / r;
end