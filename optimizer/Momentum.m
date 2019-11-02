function [fin, k, x] = Momentum(f, x, a, k, eps, lambda, gamma)
    % SGD에 관성을 추가한 형태.
    % lambda의 확률로 새로운 grad 값을 갖을 때, 이전의 grad를 gamma 비율 만큼 유지한다.
    %   grad = gamma * grad + (1-gamma) * new_grad
    
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % k - current index
    % eps - epsilon
    % lambda - percent parameter
    % gamma - momentum parameter
    
    persistent grad;
    
    if k == 0
        grad = (f(x + a) - f(x - a)) / (2*a);
    elseif lambda < rand(1)
        grad = gamma*grad + (1-gamma)*(f(x + a) - f(x - a)) / (2*a);
    end
    
    fin = abs(grad) <= 1e-3;
    x = x - a * grad;
    k = k + 1;
end
