function df = d_sigmoid(x)
f = sigmoid(x);
df = f .* (1 - f);
end