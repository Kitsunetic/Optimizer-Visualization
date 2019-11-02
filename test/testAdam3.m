%%
% Plot 3D Adam Optimizer example
%%

clear all;
close all;

addpath('../optimizer');

f = @(x, y) 4*x.^2 - 4*x.*y + 2*y.^2;
t = linspace(-10, 10, 100);
[X, Y] = meshgrid(t, t);
Z = f(X, Y);

figure;
meshc(X, Y, Z);
hold on;

beta1 = 0.9;
beta2 = 0.999;
eps = 1e-8;
a = 3;
x = rand(1)*20 - 10;
y = rand(1)*20 - 10;
z = f(x, y);

xptr = plot3(x, y, z, 'ro');
T = 500;
k = 1;
k_ = 1;

pause;

while true
    fprintf("%d: x=%f, y=%f, y=%f\n", k, x, y, z);
    
    [fin, xn] = Adam(@(l) f(l, y), x, a, eps, beta1, beta2);
    [fin, yn] = Adam(@(l) f(x, l), y, a, eps, beta1, beta2);
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

fname = "Adam3.gif";
fprintf("Write animation to '%s'\n", fname);
imwrite(mov, map, fname, 'DelayTime', 0, 'LoopCount', inf);
