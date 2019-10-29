function [fin, k, x] = SGD(f, x, a, k, eps, lambda)
    % lamda의 확률로 현 위치의 grad를 무시하고 이전의 grad로 그대로 전진
    % 2차원 그래프에서도 꽤 높은 확률로 GD의 2배 속도로 수렴한다.
    
    % f - function
    % x - variable(theta in paper)
    % a - step size
    % k - current index
    % eps - epsilon
    % lambda - percent parameter
    
    persistent grad;
    
    if k == 0 || lambda < rand(1)
        grad = (f(x + a) - f(x - a)) / (2*a);
    end
    
    fin = abs(grad) <= eps;
    x = x - a * grad;
    k = k + 1;
end
