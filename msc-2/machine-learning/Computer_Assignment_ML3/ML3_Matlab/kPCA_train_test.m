function [Ytr, Yte] = kPCA_train_test(Xtr, Xte, dims, sigma)
    ntr = size(Xtr, 1);
    nte = size(Xte, 1);

    Dtr = pdist2(Xtr, Xtr).^2;
    Ktr = exp(-Dtr / (2 * sigma^2));

    Dte = pdist2(Xte, Xtr).^2;
    Kte = exp(-Dte / (2 * sigma^2));

    One_tr = ones(ntr, ntr) / ntr;
    One_te = ones(nte, ntr) / ntr;

    Ktr_c = Ktr - One_tr * Ktr - Ktr * One_tr + One_tr * Ktr * One_tr;
    Kte_c = Kte - One_te * Ktr - Kte * One_tr + One_te * Ktr * One_tr;

    Ktr_c = (Ktr_c + Ktr_c') / 2;

    [V, E] = eig(Ktr_c);
    [evals, idx] = sort(real(diag(E)), 'descend');

    V = real(V(:, idx(1:dims)));
    evals = max(evals(1:dims), 0);

    for k = 1:dims
        V(:, k) = V(:, k) / sqrt(max(evals(k), 1e-12));
    end

    Ytr = Ktr_c * V;
    Yte = Kte_c * V;
end
