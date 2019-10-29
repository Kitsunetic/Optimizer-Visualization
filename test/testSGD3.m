%%
% Plot 3D Gradient Descent example
%%

clear all;
close all;

addpath('../optimizer');

f = @(x, y) 4*x.^2 - 4*x.*y + 2*y.^2;
t = linspace(-10, 10, 100)
[X, Y] = meshgrid(t, t);
Z = f(X, Y);
surf(X, Y, Z);
hold on;

lambda = 0.3;
eps = 0.01;
a = 0.1;
x = rand(1)*20 - 10;
y = rand(1)*20 - 10;
k = 0;

for k_ = 1:100
    fprintf("%d: x=%f, y=%f, z=%f\n", k, x, y, f(x, y));
    scatter3(x, y, f(x, y), 'ro');
    
    [fin, k, xn, yn] = SGD3(f, x, y, a, k, eps, lambda);
    if fin
        break
    end
    
    scatter3(xn, yn, f(xn, yn), 'ro');
    plot3([x, xn], [y, yn], [f(x, y), f(xn, yn)], 'r-');
    drawnow;
    x = xn;
    y = yn;
end
