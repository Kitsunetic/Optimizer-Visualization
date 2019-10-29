%%
% GD로 그래프를 그려본다.
%%

clear all;
close all;

addpath('./optimizer');

f = @(x) x.^2 + 2*x + 1;
X = -2:0.01:2;
Y = f(X);
plot(X, Y);
axis([-2, 2, 0, 10]);
hold on;

lambda = 0.7;
eps = 0.01;
a = 0.1;
x = -2;

for k = 1:100
    fprintf("%d: x = %f\n", k, x);
    
    [fin, x] = SGD(f, x, a, eps, lambda);
    %[fin, x] = GD(f, x, a, eps);
    if fin
        break
    end
    
    plot(x, f(x), 'ro');
    drawnow;
end
