function [gi] = gi(eMu, eSigma, Phat, x)
    gi = -0.5 * log(det(eSigma)) - 0.5 * (x' - eMu')' * inv(eSigma) * (x' - eMu') + log(Phat);
end
