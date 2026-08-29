function [A, B] = generateRings(N)
    r1 = sqrt(0.4*rand(N, 1));
    t1 = 2 * pi * rand(N, 1);
    A = [r1 .* cos(t1), r1 .* sin(t1)]';

    r2 = sqrt(rand(N, 1)+1.1);
    t2 = 2 * pi * rand(N, 1);
    B = [r2 .* cos(t2), r2 .* sin(t2)]';

    A = A(:, randperm(N));
    B = B(:, randperm(N));
end