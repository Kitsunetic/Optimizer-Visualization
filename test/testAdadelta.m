%%
% Plot 2D Adagrad example
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

gamma = 0.9;
lambda = 0.7;
eps = 1e-8;
a = 0.1;
x = 9;
k = 0;

xptr = plot(x, f(x), 'ro');
T = 500;

f_pos = get(gcf, 'Position');
f_width = f_pos(3);
f_height = f_pos(4);
mov = zeros(f_height, f_width+10, 1, T, 'uint8');

for k_ = 1:T
    fprintf("%d: x=%f, y=%f\n", k, x, f(x));
    
    [fin, k, xn] = Adadelta(f, x, a, k, eps, lambda, gamma);
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

% resize gif timelength
if k_ < T
    mov = mov(:, :, 1, 1:k_);
else
    fprintf("Failed to converge...\n");
end

fname = "Adadelta.gif";
fprintf("Write animation to '%s'\n", fname);
imwrite(mov, map, fname, 'DelayTime', 0, 'LoopCount', inf);