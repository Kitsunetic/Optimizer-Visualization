%%
% Plot 2D SGD example
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
%axis([-10, 10, ymin, ymax]);

hold on;

lambda = 0.7;
eps = 0.01;
a = 0.1;
x = 10;
k = 0;

for k_ = 1:100
    fprintf("%d: x = %f, y = %f\n", k, x, f(x));
    
    [fin, k, xn] = SGD(f, x, a, k, eps, lambda);
    if fin
        break
    end
    
    plot(xn, f(xn), 'ro');
    plot([x, xn], [f(x), f(xn)], 'r-');
    drawnow;
    x = xn;
end
