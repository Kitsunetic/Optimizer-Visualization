%%
% Plot 2D GD example
%%

clear all;
close all;

addpath('../optimizer');

f = @(x) x.^2 + x + 1;
X = -10:0.05:10;
Y = f(X);
plot(X, Y);
xlim([-10, 10]);
ylim([min(Y), max(Y)]);
hold on;

lambda = 0.3;
eps = 1e-8;
a = 0.1;
x = 9;
k = 0;

for k_ = 1:500
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
