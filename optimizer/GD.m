function [fin, k, x] = GD(f, x, a, k, eps)
    grad = (f(x + a) - f(x - a)) / (2*a);
    fin = abs(grad) <= eps;
    x = x - a * grad;
    k = k + 1;
end
