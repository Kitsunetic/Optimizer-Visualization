function [fin, k, x1, x2] = SGD3(f, x1, x2, a, k, eps, lambda)
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % k - current index
    % eps - epsilon
    % lambda - percent parameter
    
    persistent grad1;
    persistent grad2;
    persistent grad;
    
    if k == 0 || lambda < rand(1)
        grad1 = (f(x1+a, x2) - f(x1-a, x2)) / (2*a);
        grad2 = (f(x1, x2+a) - f(x1, x2-a)) / (2*a);
        grad = rssq([grad1, grad2]);
    end
    
    fin = abs(grad) <= eps;
    x1 = x1 - a*grad1;
    x2 = x2 - a*grad2;
    k = k + 1;
end
