function [fin, k, x] = Adagrad(f, x, a, k, eps, lambda)
    % Adagrad(Adaptive gradient?)
    % Momentum과는 다름 방향으로, 학습 속도(alpha)를 튜닝하기 시작한다.
    
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
