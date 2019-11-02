function [fin, k, x] = RMSProp(f, x, a, k, eps)
    % RMSProp is similar with Adadelta whose gamma is 0.9
    
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % k - current index
    % eps - epsilon
    
    persistent G;
    persistent H;
    
    gamma = 0.9
    
    grad = (f(x+a) - f(x-a)) / (2*a);
    if k == 0
        G = grad.^2;
        H = a.^2/(G+eps) * grad.^2;
    else
        G = gamma*G + (1-gamma)*grad.^2;
        H = gamma*H + (1-gamma)*(a.^2/(G+eps) * grad.^2);
    end
    
    fin = abs(grad) <= eps;
    x = x - a/sqrt(G+eps)*grad;
    k = k + 1;
end
