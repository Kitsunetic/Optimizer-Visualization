function [fin, x] = GD(f, x, a, eps)
    grad = (f(x + a) - f(x - a)) / (2*a);
    fin = abs(grad) <= eps;
    x = x - a * grad;
end
