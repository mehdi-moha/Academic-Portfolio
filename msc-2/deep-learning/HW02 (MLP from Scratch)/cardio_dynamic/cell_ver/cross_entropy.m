function ce = cross_entropy(y_hat, y)
epsilon = 1e-15;
y_hat = max(min(y_hat, 1 - epsilon), epsilon);
ce = -y .* log(y_hat) - (1 - y) .* log(1 - y_hat);
end