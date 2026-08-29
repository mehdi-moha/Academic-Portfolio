function [C, m] = Covariance(X, Y)
Z = [X, Y];
[r, ~] = size(Z);
m = [sum(X) / r, sum(Y) / r];
mu = repmat(m, r, 1);
C = ((Z - mu)' * (Z - mu)) / r;
end