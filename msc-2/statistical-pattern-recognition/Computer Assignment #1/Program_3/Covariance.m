function [C, m] = Covariance(U, V, W, X, Y, Z)
T = [U, V, W, X, Y, Z];
[r, ~] = size(T);
m = [sum(U) / r, sum(V) / r, sum(W) / r, sum(X) / r, sum(Y) / r, sum(Z) / r];
mu = repmat(m, r, 1);
C = ((T - mu)' * (T - mu)) / r;
end