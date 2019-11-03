function [fin, x] = AdaMax(f, x, a, beta1, beta2)
    % AdaMax Optimizer
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % beta1 - 
    % beta2 - 
    
    persistent k;
    persistent m;
    persistent v;
    persistent beta1_;
    persistent beta2_;
    
    grad = (f(x+a) - f(x-a)) / (2*a);
    if isempty(k)
        m = 0;
        v = 0;
        u = abs(grad);
        beta1_ = beta1;
        beta2_ = beta2;
        k = 1;
    else
        m = beta1*m + (1-beta1)*grad;
        u = max(beta2*v, abs(grad));
        v = beta2*v + (1-beta2)*abs(grad).^2;
        beta1_ = beta1_ * beta1;
        beta2_ = beta2_ * beta2;
        k = k + 1;
    end
    
    m_hat = m / (1-beta1_);
    v_hat = v / (1-beta2_);
    
    fin = abs(grad) <= 1e-3;
    x = x - a / u * m_hat;
end
