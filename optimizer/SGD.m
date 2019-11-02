function [fin, x] = SGD(f, x, a, eps, lambda)
    % lamda의 확률로 현 위치의 grad를 무시하고 이전의 grad로 그대로 전진
    % 2차원 그래프에서도 꽤 높은 확률로 GD의 2배 속도로 수렴한다.
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % lambda - percent parameter
    
    persistent k;
    persistent grad;
    
    if isempty(k) || lambda < rand(1)
        grad = (f(x + a) - f(x - a)) / (2*a);
        k = 1;
    end
    
    fin = abs(grad) <= 1e-3;
    x = x - a * grad;
end
