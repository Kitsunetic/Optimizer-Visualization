%%
% Plot 2D GD example
%%

clear all;
close all;

addpath('../optimizer');

f = @(x) x.^2 + 2*x + 1;
X = -2:0.01:2;
Y = f(X);
plot(X, Y);
axis([-2, 2, 0, 10]);
hold on;

lambda = 0.3;
eps = 0.01;
a = 0.1;
x = -2;
k = 0;

for k_ = 1:100
    fprintf("%d: x = %f, y = %f\n", k, x, f(x));
    
    [fin, k, xn] = GD(f, x, a, k, eps);
    if fin
        break
    end
    
    plot(xn, f(xn), 'ro');
    plot([x, xn], [f(x), f(xn)], 'r-');
    drawnow;
    x = xn;
end
