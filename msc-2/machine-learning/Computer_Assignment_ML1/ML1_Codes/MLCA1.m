clc;
clear;
close all;
hold on;

mu1 = [1, 1];
Sigma1 = [2, 0; 0, 1];
mu2 = [3, 2];
Sigma2 = [2, 0; 0, 1];

% mu1 = [1, 1];
% Sigma1 = [2, 0.5; 0.5, 1];
% mu2 = [3, 2];
% Sigma2 = [1, 0.5; 0.5, 2];

N1 = 35000;
N2 = 35000;
dataI1 = randperm(N1);
dataI2 = randperm(N2);

R1 = zeros(N1, 3);
R2 =  ones(N2, 3);
R1(:, 1:2) = mvnrnd(mu1, Sigma1, N1);
R2(:, 1:2) = mvnrnd(mu2, Sigma2, N2);

trainP = 0.75;

[eSigma1, em1] = Covariance(R1(dataI1(1:trainP*N1), 1), R1(dataI1(1:trainP*N1), 2))
[eSigma2, em2] = Covariance(R2(dataI2(1:trainP*N2), 1), R2(dataI2(1:trainP*N2), 2))

plot(R1(dataI1(trainP*N1+1:N1), 1), R1(dataI1(trainP*N1+1:N1), 2), '+m')
plot(R2(dataI2(trainP*N2+1:N2), 1), R2(dataI2(trainP*N2+1:N2), 2), '+b')

MinXY = min(min(min(R1(:, 1), R1(:, 2)), min(min(R2(:, 1), R2(:, 2)))));
MaxXY = max(max(max(R1(:, 1), R1(:, 2)), max(max(R2(:, 1), R2(:, 2)))));
X = MinXY:0.1:MaxXY;
Y = MinXY:0.1:MaxXY;

f1 = zeros(size(X, 1), size(X, 1));
f2 = zeros(size(X, 1), size(X, 1));
p1 = zeros(size(X, 1), size(X, 1));
p2 = zeros(size(X, 1), size(X, 1));

i = 1;
for y = MinXY:0.1:MaxXY
    j = 1;
    for x = MinXY:0.1:MaxXY
        f1(i, j) = mvar(x, y, em1(1), em1(2), eSigma1);
        f2(i, j) = mvar(x, y, em2(1), em2(2), eSigma2);
        p1(i, j) = f1(i, j) / (f1(i, j) + f2(i, j));
        p2(i, j) = f2(i, j) / (f1(i, j) + f2(i, j));
        j = j + 1;
    end
    i = i + 1;
end

contour(MinXY:0.1:MaxXY, MinXY:0.1:MaxXY, f1, 20);
contour(MinXY:0.1:MaxXY, MinXY:0.1:MaxXY, f2, 20);
xlabel('x1');
ylabel('x2');
axis([MinXY, MaxXY, MinXY, MaxXY]);
contour(MinXY:0.1:MaxXY, MinXY:0.1:MaxXY, p1-p2, [0, 0]);

Phat_C1 = numel(1:trainP*N1) / (numel(1:trainP*N1) + numel(1:trainP*N2));
Phat_C2 = numel(1:trainP*N2) / (numel(1:trainP*N1) + numel(1:trainP*N2));

gt1 = zeros(length(Y), length(X));
gt2 = zeros(length(Y), length(X));

i = 1;
for y = MinXY:0.1:MaxXY
    j = 1;
    for x = MinXY:0.1:MaxXY
        gt1(i, j) = gi(mu1, Sigma1, Phat_C1, [x, y]);
        gt2(i, j) = gi(mu2, Sigma2, Phat_C2, [x, y]);
        j = j + 1;
    end
    i = i + 1;
end

contour(MinXY:0.1:MaxXY, MinXY:0.1:MaxXY, gt1-gt2, [0, 0], 'k', 'LineWidth', 2);

e11 = abs(Sigma1-eSigma1)
e12 = abs(mu1-em1)
e21 = abs(Sigma2-eSigma2)
e22 = abs(mu2-em2)

[testSigma1, testm1] = Covariance(R1(dataI1(trainP*N1+1:N1), 1), R1(dataI1(trainP*N1+1:N1), 2))
[testSigma2, testm2] = Covariance(R2(dataI2(trainP*N2+1:N2), 1), R2(dataI2(trainP*N2+1:N2), 2))

test_e11 = abs(Sigma1-testSigma1)
test_e12 = abs(mu1-testm1)
test_e21 = abs(Sigma2-testSigma2)
test_e22 = abs(mu2-testm2)

g11 = zeros(size(trainP*N1+1:N1, 2), 1);
g12 = zeros(size(trainP*N1+1:N1, 2), 1);
i = 1;
for j = trainP*N1+1:N1
    g11(i) = gi(em1, eSigma1, Phat_C1, [R1(dataI1(j), 1), R1(dataI1(j), 2)]);
    g12(i) = gi(em2, eSigma2, Phat_C2, [R1(dataI1(j), 1), R1(dataI1(j), 2)]);
    i = i + 1;
end
Pt1 = sum((g11 - g12) > 0 | (R1(dataI1(trainP*N1+1:N1), 3)))/(size(trainP*N1+1:N1, 2))

g21 = zeros(size(trainP*N2+1:N2, 2), 1);
g22 = zeros(size(trainP*N2+1:N2, 2), 1);
i = 1;
for j = trainP*N2+1:N2
    g21(i) = gi(em1, eSigma1, Phat_C1, [R2(dataI2(j), 1), R2(dataI2(j), 2)]);
    g22(i) = gi(em2, eSigma2, Phat_C2, [R2(dataI2(j), 1), R2(dataI2(j), 2)]);
    i = i + 1;
end
Pt2 = sum((g22 - g21) > 0 & (R2(dataI2(trainP*N2+1:N2), 3)))/(size(trainP*N2+1:N2, 2))

Correct_C1 = sum(g11 > g12);
Wrong_C1 = sum(g11 <= g12);

Correct_C2 = sum(g22 > g21);
Wrong_C2 = sum(g22 <= g21);

ConfusionMatrix = [Correct_C1, Wrong_C1; Wrong_C2, Correct_C2]

Ptotal = (Correct_C1 + Correct_C2) / (Correct_C1 + Wrong_C1 + Correct_C2 + Wrong_C2)
Perror = 1 - Ptotal

[x, y] = ginput;
plot(x, y, 'or', 'LineWidth', 1.5);

for i = 1:size(x)
    g1 = gi(em1, eSigma1, Phat_C1, [x(i), y(i)]);
    g2 = gi(em2, eSigma2, Phat_C2, [x(i), y(i)]);
    text(x(i), y(i), strcat('\rightarrow', ' g1 = ', num2str(g1), ' g2 = ', num2str(g2)));
end
