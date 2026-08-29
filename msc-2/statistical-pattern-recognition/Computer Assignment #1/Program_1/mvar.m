function p = mvar(x, y, mux, muy, sigma)
p = (1.0 / (2 * pi * sqrt(det(sigma)))) .* exp(-0.5*[x - mux; y - muy]'*inv(sigma)*[x - mux; y - muy]);
end
