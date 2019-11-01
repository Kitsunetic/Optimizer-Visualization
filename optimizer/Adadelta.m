function [fin, k, x] = Adadelta(f, x, a, k, eps, lambda, gamma)
    % Adadelta is an extension of Adagrad that seeks to reduce its aggressive, monotonically decreasing
    % learning rate. Instead of accumulating all past squared gradients, Adadelta restricts the window of
    % accumulated past gradients to some fixed size w.
    
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % k - current index
    % eps - epsilon
    % lambda - percent parameter
    
    persistent G;
    persistent H;
    
    grad = (f(x+a) - f(x-a)) / (2*a);
    if k == 0
        G = grad.^2;
        H = a.^2/(G+eps) * grad.^2;
    else
        G = gamma*G + (1-gamma)*grad.^2;
        H = gamma*H + (1-gamma)*(a.^2/(G+eps) * grad.^2);
    end
    
    fin = abs(grad) <= eps;
    x = x - sqrt(H+eps)/sqrt(G+eps)*grad;
    k = k + 1;
end
