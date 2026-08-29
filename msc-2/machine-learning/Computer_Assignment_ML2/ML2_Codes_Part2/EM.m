clc;
clear;
close all;

colormap('jet');
hold on;

saveflag = 1;

mu = zeros(2, 3);
mu(:, 1) = [3; 5];
mu(:, 2) = [2; 0.4];
mu(:, 3) = [4; 3];

Sigma = zeros(2, 6);
Sigma(:, 1:2) = [1, 0; 0, 1];
Sigma(:, 3:4) = [1, 0; 0, 1];
Sigma(:, 5:6) = [1, 0; 0, 1];

N = 100;

R1 = zeros(6, N);
R2 = zeros(6, N);
R3 = zeros(6, N);

Sigmahit = zeros(1, 3);

s = zeros(2, 3);
t = zeros(2, 3);
milplus1 = zeros(2, 3);

ss = zeros(2, 6);
tt = zeros(2, 6);
silplus1 = zeros(2, 6);

% Sample Data #1
R1(1:2, :) = mvnrnd([-2, -2], [1, 0; 0, 1], N)';
R2(1:2, :) = mvnrnd([2, 2], [1, 0; 0, 1], N)';
R3(1:2, :) = mvnrnd([6, 6], [1, 0; 0, 1], N)';
MaxIt = 50;

%% Sample Data #2
%R1(1:2, :) = mvnrnd([-2, -2], [1, 0; 0, 16], N)';
%R2(1:2, :) = mvnrnd([2, 2], [1, 0; 0, 16], N)';
%R3(1:2, :) = mvnrnd([6, 6], [1, 0; 0, 16], N)';
%MaxIt = 50;

R = [R1, R2, R3];

MinXY = min(min(min(R1(1, :), R1(2, :)), min(min(R2(1, :), R2(2, :)))));
MaxXY = max(max(max(R1(1, :), R1(2, :)), max(max(R2(1, :), R2(2, :)))));
MinXXYY = min(MinXY, min(min(R3(1, :), R3(2, :))));
MaxXXYY = max(MaxXY, max(max(R3(1, :), R3(2, :))));
X = MinXXYY:0.1:MaxXXYY;
Y = MinXXYY:0.1:MaxXXYY;

plot(R1(1, :)', R1(2, :)', 'or', 'MarkerSize', 2);
plot(R2(1, :)', R2(2, :)', 'og', 'MarkerSize', 2);
plot(R3(1, :)', R3(2, :)', 'ob', 'MarkerSize', 2);
xlabel('x1');
ylabel('x2');
axis([MinXXYY, MaxXXYY, MinXXYY, MaxXXYY]);

PG = zeros(1, 3);
PG(1, 1) = numel(R1(1, :)) / numel(R(1, :));
PG(1, 2) = numel(R2(1, :)) / numel(R(1, :));
PG(1, 3) = numel(R3(1, :)) / numel(R(1, :));

for it = 1:MaxIt
    hold on;
    for i = 1:3 * N
        for j = 1:3
            R(j+2, i) = PG(1, j) * det(Sigma(:, 2*j-1:2*j))^-0.5 * exp(-0.5*(R(1:2, i) - mu(:, j))'*inv(Sigma(:, 2*j-1:2*j))*(R(1:2, i) - mu(:, j)));
        end
        R(6, i) = sum(R(3:5, i));
        for j = 1:3
            R(j+2, i) = R(j+2, i) / R(6, i);
        end
    end
    for i = 1:3
        Sigmahit(i) = sum(R(i+2, :));
    end
    for i = 1:3 * N
        for j = 1:3
            s(:, j) = (R(j+2, i) .* R(1:2, i));
        end
        for j = 1:3
            t(:, j) = s(:, j) + t(:, j);
        end
    end
    for i = 1:3
        milplus1(:, i) = t(:, i) ./ Sigmahit(i);
    end
    mu = milplus1;

    for i = 1:3 * N
        for j = 1:3
            ss(:, 2*j-1:2*j) = (R(j+2, i) .* ((R(1:2, i) - milplus1(:, j)) * (R(1:2, i) - milplus1(:, j))'));
        end
        for j = 1:3
            tt(:, 2*j-1:2*j) = ss(:, 2*j-1:2*j) + tt(:, 2*j-1:2*j);
        end
    end
    for i = 1:3
        silplus1(:, 2*i-1:2*i) = tt(:, 2*i-1:2*i) ./ Sigmahit(i);
    end
    Sigma = silplus1;

    PG(1, 1) = Sigmahit(1) / numel(R(1, :));
    PG(1, 2) = Sigmahit(2) / numel(R(1, :));
    PG(1, 3) = Sigmahit(3) / numel(R(1, :));

    f1 = zeros(size(X, 1), size(X, 1));
    f2 = zeros(size(X, 1), size(X, 1));
    f3 = zeros(size(X, 1), size(X, 1));

    i = 1;
    for y = MinXXYY:0.1:MaxXXYY
        j = 1;
        for x = MinXXYY:0.1:MaxXXYY
            f1(i, j) = mvar(x, y, mu(1, 1), mu(2, 1), Sigma(:, 1:2));
            f2(i, j) = mvar(x, y, mu(1, 2), mu(2, 2), Sigma(:, 3:4));
            f3(i, j) = mvar(x, y, mu(1, 3), mu(2, 3), Sigma(:, 5:6));
            j = j + 1;
        end;
        i = i + 1;
    end;

    contour(MinXXYY:0.1:MaxXXYY, MinXXYY:0.1:MaxXXYY, f1, 8, 'LineWidth', 3);
    contour(MinXXYY:0.1:MaxXXYY, MinXXYY:0.1:MaxXXYY, f2, 8, 'LineWidth', 3);
    contour(MinXXYY:0.1:MaxXXYY, MinXXYY:0.1:MaxXXYY, f3, 8, 'LineWidth', 3);

    plot(R1(1, :)', R1(2, :)', 'or', 'MarkerSize', 2);
    plot(R2(1, :)', R2(2, :)', 'og', 'MarkerSize', 2);
    plot(R3(1, :)', R3(2, :)', 'ob', 'MarkerSize', 2);

    t(:) = 0;
    tt(:) = 0;

    title(['Iteration Number: ', num2str(it)]);
    if saveflag
        print(['Frame ', num2str(it, '%04d')], '-dpng', '-r150');
    end
    pause(0.001);
    if it < MaxIt
        clf;
    end
end

if saveflag
    GifName = 'EM.gif';
    delay = 0.5;
    for i = 1:MaxIt
        [AA, ~] = imread(['Frame ', num2str(i, '%04d'), '.png']);
        [X, map] = rgb2ind(AA, 256);
        if i == 1
            imwrite(X, map, GifName, 'gif', 'LoopCount', inf, 'DelayTime', delay)
        else
            imwrite(X, map, GifName, 'gif', 'WriteMode', 'append', 'DelayTime', delay)
        end
    end
end
