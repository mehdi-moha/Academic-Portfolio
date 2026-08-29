function Vn = Vn(D, RkDX)
CD = pi^(D / 2) / gamma(D/2+1);
Vn = CD * RkDX ^ D;
end