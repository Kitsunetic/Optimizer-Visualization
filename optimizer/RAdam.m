function [fin, k, x] = NAdam(f, x, a, k, eps, beta1, beta2)
    % RAdam(Rectified Adam) Optimizer
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
    
    persistent row_inf;
    
    grad = (f(x+a) - f(x-a)) / (2*a);
    if k == 0
        m = grad;
        v = grad.^2;
        beta1_ = beta1;
        beta2_ = beta2;
        
        row_inf = 2 / (1-beta2) - 1;
    else
        m = beta1*m + (1-beta1)*grad;
        v = beta2*v + (1-beta2)*grad.^2;
        beta1_ = beta1_ * beta1;
        beta2_ = beta2_ * beta2;
    end
    
    m_hat = m / (1-beta1_);
    row = row_inf - 2*(k+1)*beta2_/(1-beta2_);
    if row >= 5
        v_hat = sqrt(v/(1-beta2_));
        r = sqrt((row-4)/(row_inf-4) * (row-2)/(row_inf-2) * row_inf/row);
        % Update parameters with adaptive momentum
        fprintf("r=%f, v_hat=%f, m_hat=%f\n", r, v_hat, m_hat);
        x = x - a*r*m_hat/v_hat;
    else
        % Update parameters with un-adapted momentum
        x = x - a*m_hat;
    end
    
    fin = abs(grad) <= 1e-3;
    k = k + 1;
end
