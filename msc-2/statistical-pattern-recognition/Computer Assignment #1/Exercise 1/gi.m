function [gi] = gi(eMu, eSigma, Phat, x, i)
switch i
    case 1
        gi = -0.5 * log(det(eSigma)) - 0.5 * (x' - eMu')' * inv(eSigma) * (x' - eMu') + log(Phat);
    case 2
        gi = -0.5 * (x' - eMu')' * inv(eSigma) * (x' - eMu');
    case 3
        gi = -(x' - eMu')' * (x' - eMu');
end
end