function [fin, k, x] = Adadelta(f, x, a, k, eps, gamma)
    % Adadelta is an extension of Adagrad that seeks to reduce its aggressive, monotonically decreasing
    % learning rate. Instead of accumulating all past squared gradients, Adadelta restricts the window of
    % accumulated past gradients to some fixed size w.
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % k - current index
    % eps - epsilon
    
    persistent k;
    persistent G;
    persistent H;
    
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
    x = x - sqrt(H+eps)/sqrt(G+eps)*grad;
end
