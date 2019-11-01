function [fin, k, x] = Adagrad(f, x, a, k, eps, lambda)
    % Adagrad(Adaptive gradient?)
    % Momentum과는 다름 방향으로, 학습 속도(alpha)를 튜닝하기 시작한다.
    % 하지만, G가 단순하게 계속 커지기만 하기 때문에
    % 학습 횟수가 커지면 G는 발산하고, learning rate가 0으로 수렴해버리는 현상이 나타난다는 단점이 있다.
    
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
