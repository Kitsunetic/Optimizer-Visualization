function [fin, x] = NAG(f, x, a, lambda, gamma)
    % NAG(Nesterov accelerated gradient)
    % Momentum을 업데이트해서 나온 것.
    % 미래의 예측되는 위치의 gradient를 업데이트에 사용해서 이동을 가속한다.
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
        gg = gamma*grad;
        grad = gg + (1-gamma)*(f(x-gg + a) - f(x-gg - a)) / (2*a);
        k = k + 1;
    end
    
    fin = abs(grad) <= 1e-3;
    x = x - a * grad;
end
