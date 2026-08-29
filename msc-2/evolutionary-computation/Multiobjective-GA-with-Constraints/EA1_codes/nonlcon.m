function [c, ceq] = nonlcon(x)
c = 2 * x(1) - x(2)^2 - 6;
ceq = [];
end