function [ S ] = gamma_correction(C,I,gamma)
S=(C*I).^(gamma);
end