function [fin, k, x] = Adadelta(f, x, a, k, eps, lambda)
    % Adadelta
    % Adadelta [22] is an extension of Adagrad that seeks to reduce its aggressive, monotonically decreasing
    % learning rate. Instead of accumulating all past squared gradients, Adadelta restricts the window of
    % accumulated past gradients to some fixed size w.
    
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % k - current index
    % eps - epsilon
    % lambda - percent parameter
    
    persistent G;
    
    if k == 0
        G = [x.^2];
    else
        G(k+1) = x.^2;
    end
    grad = (f(x+a) - f(x-a)) / (2*a);
    
    fin = abs(grad) <= eps;
    x = x - a/sqrt(sum(G)+eps) * grad;
    k = k + 1;
end
