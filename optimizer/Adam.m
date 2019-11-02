function [fin, k, x] = Adam(f, x, a, k, eps, beta1, beta2)
    % Adam Optimizer
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % k - current index
    % eps - epsilon
    % beta1 - 
    % beta2 - 
    
    persistent m;
    persistent v;
    persistent beta1_;
    persistent beta2_;
    
    grad = (f(x+a) - f(x-a)) / (2*a);
    if k == 0
        m = grad;
        v = grad.^2;
        beta1_ = beta1;
        beta2_ = beta2;
    else
        m = beta1*m + (1-beta1)*grad;
        v = beta2*v + (1-beta2)*grad.^2;
        beta1_ = beta1_ * beta1;
        beta2_ = beta2_ * beta2;
    end
    
    m_hat = m / (1-beta1_);
    v_hat = v / (1-beta2_);
    
    fin = abs(grad) <= 1e-3;
    x = x - a / (sqrt(v_hat) + eps) * m_hat;
    k = k + 1;
end
