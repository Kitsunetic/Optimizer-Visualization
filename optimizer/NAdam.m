function [fin, x] = NAdam(f, x, a, eps, beta1, beta2)
    % NAdam Optimizer
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % k - current index
    % eps - epsilon
    % beta1 - 
    % beta2 - 
    persistent k;
    persistent m;
    persistent v;
    persistent beta1_;
    persistent beta2_;
    
    grad = (f(x+a) - f(x-a)) / (2*a);
    if isempty(k)
        m = grad;
        v = grad.^2;
        beta1_ = beta1;
        beta2_ = beta2;
        k = 1;
    else
        m = beta1*m + (1-beta1)*grad;
        v = beta2*v + (1-beta2)*grad.^2;
        beta1_ = beta1_ * beta1;
        beta2_ = beta2_ * beta2;
        k = k + 1;
    end
    
    m_hat = m / (1-beta1_);
    v_hat = v / (1-beta2_);
    
    fin = abs(grad) <= 1e-3;
    x = x - a / (sqrt(v_hat) + eps) * (beta1*m_hat + (1-beta1)*grad/(1-beta1_));
end
