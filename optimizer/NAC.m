function [fin, k, x] = NAC(f, x, a, k, eps, lambda, gamma)
    % NAC(Nesterov accelerated gradient)
    % Momentum을 업데이트해서 나온 것.
    % 미래의 예측되는 위치의 gradient를 업데이트에 사용해서 이동을 가속한다.
    
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
        gg = gamma*grad;
        grad = gg + (1-gamma)*(f(x-gg + a) - f(x-gg - a)) / (2*a);
    end
    
    fin = abs(grad) <= eps;
    x = x - a * grad;
    k = k + 1;
end
