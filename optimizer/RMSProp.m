function [fin, x] = RMSProp(f, x, a, eps)
    % RMSProp is similar with Adadelta whose gamma is 0.9
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % eps - epsilon
    
    persistent k;
    persistent G;
    persistent H;
    
    gamma = 0.9
    
    grad = (f(x+a) - f(x-a)) / (2*a);
    if isempty(k)
        G = grad.^2;
        H = a.^2/(G+eps) * grad.^2;
        k = 1;
    else
        G = gamma*G + (1-gamma)*grad.^2;
        H = gamma*H + (1-gamma)*(a.^2/(G+eps) * grad.^2);
        k = k + 1;
    end
    
    fin = abs(grad) <= 1e-3;
    x = x - a/sqrt(G+eps)*grad;
end
