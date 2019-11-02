%%
% Plot 3D RAdam Optimizer example
%%

clear all;
close all;

addpath('../optimizer');

f = @(x, y) x.^2 + y.^3;
t = linspace(-2, 2, 200);
[X, Y] = meshgrid(t, t);
Z = f(X, Y);

figure;
meshc(X, Y, Z);
alpha(0.1);
axis([-2, 2, -2, 2, -12, 12]);
hold on;

beta1 = 0.9;
beta2 = 0.6;
eps = 1e-8;
a = 0.01;
x = 1.739;
y = 1.216;
z = f(x, y);

xptr = plot3(x, y, z, 'ro');
k = 1;
k_ = 1;

pause;

while true
    if mod(k, 10) == 0
        fprintf("%d: x=%f, y=%f, y=%f\n", k, x, y, z);
    end
    
    [fin, xn] = RAdam(@(l) f(l, y), x, a, eps, beta1, beta2);
    [fin, yn] = RAdam(@(l) f(x, l), y, a, eps, beta1, beta2);
    zn = f(xn, yn);
    if fin
        break
    end
    
    plot3([x, xn], [y, yn], [z, zn], 'r-');
    x = xn; y = yn; z = zn;
    set(xptr, 'XData', x, 'YData', y, 'ZData', z);
    drawnow;
    
    frame = getframe(gcf);
    if k == 1
        [mov(:, :, 1, k_), map] = rgb2ind(frame.cdata, 256, 'nodither');
        k_ = k_ + 1;
    elseif mod(k, 5) == 0
        mov(:, :, 1, k_) = rgb2ind(frame.cdata, map, 'nodither');
        k_ = k_ + 1;
    end
    
    k = k + 1;
end

fname = "RAdam3.gif";
fprintf("Write animation to '%s'\n", fname);
imwrite(mov, map, fname, 'DelayTime', 0, 'LoopCount', inf);
