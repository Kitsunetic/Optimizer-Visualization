function [fin, x] = GD(f, x, a)
    grad = (f(x + a) - f(x - a)) / (2*a);
    fin = abs(grad) <= 1e-3;
    x = x - a * grad;
end
