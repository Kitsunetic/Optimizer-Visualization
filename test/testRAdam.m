%%
% Plot 2D NAdam Optimizer example
%%

clear all;
close all;

addpath('../optimizer');

f = @(x) x.^2 + x + 1;
X = -10:0.05:10;
Y = f(X);

figure;
plot(X, Y);
xlim([-10, 10]);
ylim([min(Y), max(Y)]);

hold on;

beta1 = 0.9;
beta2 = 0.6;
eps = 1e-8;
a = 0.01;
%x = rand(1)*20 - 10;
x = 10;
k = 0;

xptr = plot(x, f(x), 'ro');
T = 500;

for k_ = 1:T
    fprintf("%d: x=%f, y=%f\n", k, x, f(x));
    
    [fin, k, xn] = RAdam(f, x, a, k, eps, beta1, beta2);
    if fin
        break
    end
    
    plot([x, xn], [f(x), f(xn)], 'r-');
    x = xn;
    set(xptr, 'XData', x, 'YData', f(x));
    drawnow;
    
    frame = getframe(gcf);
    if k_ == 1
        [mov(:, :, 1, k_), map] = rgb2ind(frame.cdata, 256, 'nodither');
    else
        mov(:, :, 1, k_) = rgb2ind(frame.cdata, map, 'nodither');
    end
end

fname = "RAdam.gif";
fprintf("Write animation to '%s'\n", fname);
imwrite(mov, map, fname, 'DelayTime', 0, 'LoopCount', inf);
