function [fin, k, x1, x2] = GD3(f, x1, x2, a, k, eps)
    grad1 = (f(x1+a, x2) - f(x1-a, x2)) / (2*a);
    grad2 = (f(x1, x2+a) - f(x1, x2-a)) / (2*a);
    grad = rssq([grad1, grad2]);
    fin = abs(grad) <= 1e-3;
    x1 = x1 - a*grad1;
    x2 = x2 - a*grad2;
    k = k + 1;
end
