function [fin, x] = Momentum(f, x, a, lambda, gamma)
    % SGD에 관성을 추가한 형태.
    % lambda의 확률로 새로운 grad 값을 갖을 때, 이전의 grad를 gamma 비율 만큼 유지한다.
    %   grad = gamma * grad + (1-gamma) * new_grad
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % lambda - percent parameter
    % gamma - momentum parameter
    
    persistent k;
    persistent grad;
    
    if isempty(k)
        grad = (f(x + a) - f(x - a)) / (2*a);
        k = 1;
    elseif lambda < rand(1)
        grad = gamma*grad + (1-gamma)*(f(x + a) - f(x - a)) / (2*a);
        k = k + 1;
    end
    
    fin = abs(grad) <= 1e-3;
    x = x - a * grad;
end
