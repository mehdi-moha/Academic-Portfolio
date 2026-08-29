function Acc = calc_accuracy(y_hat, y)
TP = sum(y_hat(y == 1) > 0.5);
TN = sum(y_hat(y == 0) < 0.5);
FP = sum(y_hat(y == 0) > 0.5);
FN = sum(y_hat(y == 1) < 0.5);
Acc = (TP + TN) / (TP + FP + TN + FN);
end