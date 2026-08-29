function dce = d_cross_entropy(y_hat, y)
epsilon = 1e-15;
y_hat = max(min(y_hat, 1 - epsilon), epsilon);
dce = (-y ./ y_hat) + ((1 - y) ./ (1 - y_hat));
end