function [fin, k, x] = AdaMax(f, x, a, k, eps, beta1, beta2)
    % AdaMax Optimizer
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
        u = abs(grad);
        beta1_ = beta1;
        beta2_ = beta2;
    else
        m = beta1*m + (1-beta1)*grad;
        u = max(beta2*v, abs(grad));
        v = beta2*v + (1-beta2)*abs(grad).^2;
        beta1_ = beta1_ * beta1;
        beta2_ = beta2_ * beta2;
    end
    
    m_hat = m / (1-beta1_);
    v_hat = v / (1-beta2_);
    
    fin = abs(grad) <= eps;
    x = x - a / u * m_hat;
    k = k + 1;
end
