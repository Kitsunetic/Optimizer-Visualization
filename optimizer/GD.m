function [fin, x] = GD(f, x, a, eps)
    grad = (f(x + a) - f(x - a)) / (2*a);
    fprintf("x=%f, grad=%f\n", x, grad);
    fin = abs(grad) <= eps; 
    x = x - a * grad;
end
