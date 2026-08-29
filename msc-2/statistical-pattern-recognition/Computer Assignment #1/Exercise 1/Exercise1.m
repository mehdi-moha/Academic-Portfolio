clc
clear
close all

mu1 = [1, 1];
mu2 = [10, 5];
mu3 = [11, 1];
Sigma = [7, 4; 4, 5];
N1 = 333;
N2 = 333;
N3 = 334;

R1 = zeros(N1, 3);
R2 = zeros(N2, 3);
R3 = zeros(N3, 3);

R1(:, 3) = 1;
R2(:, 3) = 2;
R3(:, 3) = 3;

R1(:, 1:2) = mvnrnd(mu1, Sigma, N1);
R2(:, 1:2) = mvnrnd(mu2, Sigma, N2);
R3(:, 1:2) = mvnrnd(mu3, Sigma, N3);

[eSigma1, em1] = Covariance(R1(:, 1), R1(:, 2));
[eSigma2, em2] = Covariance(R2(:, 1), R2(:, 2));
[eSigma3, em3] = Covariance(R3(:, 1), R3(:, 2));

Phat_C1 = N1 / (numel(R1(:, 3)) + numel(R2(:, 3)) + numel(R3(:, 3)));
Phat_C2 = N2 / (numel(R1(:, 3)) + numel(R2(:, 3)) + numel(R3(:, 3)));
Phat_C3 = N3 / (numel(R1(:, 3)) + numel(R2(:, 3)) + numel(R3(:, 3)));

for i = 1:3
    g11 = zeros(N1, 1);
    g12 = zeros(N1, 1);
    g13 = zeros(N1, 1);

    j = 1;
    for k = 1:N1
        g11(j) = gi(em1, eSigma1, Phat_C1, [R1(k, 1), R1(k, 2)], i);
        g12(j) = gi(em2, eSigma2, Phat_C2, [R1(k, 1), R1(k, 2)], i);
        g13(j) = gi(em3, eSigma3, Phat_C3, [R1(k, 1), R1(k, 2)], i);
        j = j + 1;
    end
    Pt1vs23 = (sum((g11 - g12) > 0 & (R1(:, 3) == 1)) + sum((g11 - g13) > 0 & (R1(:, 3) == 1))) / (numel(R1(:, 3)) * 2);
    err123 = 1 - Pt1vs23;

    g21 = zeros(N2, 1);
    g22 = zeros(N2, 1);
    g23 = zeros(N2, 1);

    j = 1;
    for k = 1:N2
        g21(j) = gi(em1, eSigma1, Phat_C1, [R2(k, 1), R2(k, 2)], i);
        g22(j) = gi(em2, eSigma2, Phat_C2, [R2(k, 1), R2(k, 2)], i);
        g23(j) = gi(em3, eSigma3, Phat_C3, [R2(k, 1), R2(k, 2)], i);
        j = j + 1;
    end
    Pt2vs13 = (sum((g22 - g21) > 0 & (R2(:, 3) == 2)) + sum((g22 - g23) > 0 & (R2(:, 3) == 2))) / (numel(R2(:, 3)) * 2);
    err213 = 1 - Pt2vs13;

    g31 = zeros(N3, 1);
    g32 = zeros(N3, 1);
    g33 = zeros(N3, 1);

    j = 1;
    for k = 1:N3
        g31(j) = gi(em1, eSigma1, Phat_C1, [R3(k, 1), R3(k, 2)], i);
        g32(j) = gi(em2, eSigma2, Phat_C2, [R3(k, 1), R3(k, 2)], i);
        g33(j) = gi(em3, eSigma3, Phat_C3, [R3(k, 1), R3(k, 2)], i);
        j = j + 1;
    end
    Pt3vs12 = (sum((g33 - g31) > 0 & (R3(:, 3) == 3)) + sum((g33 - g32) > 0 & (R3(:, 3) == 3))) / (numel(R3(:, 3)) * 2);
    err312 = 1 - Pt3vs12;

    switch i
        case 1
            display(['Mean Error of Bayes Classifier: ', num2str((err123 + err213 + err312)/3)]);
        case 2
            display(['Mean Error of Mahalanobis Distance Classifier: ', num2str((err123 + err213 + err312)/3)]);
        case 3
            display(['Mean Error of Euclidean Distance Classifier: ', num2str((err123 + err213 + err312)/3)]);
    end
end