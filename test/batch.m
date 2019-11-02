% Batch all optimizers
%%

%% initialize and import libraries
clear all;
close all;

addpath('../optimizer');

%% draw function layout
f = @(x, y) x.^2 + y.^3;
t = linspace(-2, 2, 200);
[X, Y] = meshgrid(t, t);
Z = f(X, Y);
figure;
meshc(X, Y, Z);
alpha(0.1);
axis([-2, 2, -2, 2, -12, 12]);
hold on;

%% shared hyper parameters
% ! update here !
a = 0.05;
lambda = 0.7;
gamma = 0.3;
eps = 1e-8;
beta1 = 0.9;
beta2 = 0.6;

num_epoch = 200;
x = 1.739;
y = 1.216;

%% initialize variables
optimizer_names = [
    "GD",
    "SGD",
    "Momentum",
    "NAC",
    "Adagrad",
    "Adadelta",
    "RMSprop",
    "Adam",
    "AdaMax",
    "NAdam",
    "RAdam"
];
num_optimizers = length(optimizer_names);
x = ones(1, num_optimizers) .* x;
y = ones(1, num_optimizers) .* y;
z = ones(1, num_optimizers) .* f(x, y);
k = 1;
k_ = 1;
colors = rand(3, num_optimizers);
xn = zeros(1, num_optimizers);
yn = zeros(1, num_optimizers);
zn = zeros(1, num_optimizers);

%% draw cursor
for i = 1:num_optimizers
    xptr(i) = plot3(x, y, z, 'color', colors(:, i), 'marker', 'o');
    set(xptr(i), 'MarkerFaceColor', colors(:, i));
end

%% !! press any key to start !! 
pause;

%% iterate epoch
for epoch = 1:num_epoch
    if mod(k, 10) == 0
        for i = 1:num_optimizers
            fprintf("%d %s | x=%f, y=%f, y=%f\n", epoch, optimizer_names(i), x(i), y(i), z(i));
        end
    end
    
    %% calculate next step
    [fin, xn(1)]  = GD      (@(l) f(l, y(1 )), x(1) , a);
    [fin, xn(2)]  = SGD     (@(l) f(l, y(2 )), x(2) , a, eps   , lambda);
    [fin, xn(3)]  = Momentum(@(l) f(l, y(3 )), x(3) , a, lambda, gamma);
    [fin, xn(4)]  = NAC     (@(l) f(l, y(4 )), x(4) , a, lambda, gamma);
    [fin, xn(5)]  = Adagrad (@(l) f(l, y(5 )), x(5) , a, eps);
    [fin, xn(6)]  = Adadelta(@(l) f(l, y(6 )), x(6) , a, eps   , gamma);
    [fin, xn(7)]  = RMSProp (@(l) f(l, y(7 )), x(7) , a, eps);
    [fin, xn(8)]  = Adam    (@(l) f(l, y(8 )), x(8) , a, eps   , beta1 , beta2);
    [fin, xn(9)]  = AdaMax  (@(l) f(l, y(9 )), x(9) , a,         beta1 , beta2);
    [fin, xn(10)] = NAdam   (@(l) f(l, y(10)), x(10), a, eps   , beta1 , beta2);
    [fin, xn(11)] = RAdam   (@(l) f(l, y(11)), x(11), a, eps   , beta1 , beta2);
    
    % !! add here new optimizers !!
    
    [fin, yn(1)]  = GD      (@(l) f(x(1 ), l), y(1) , a);
    [fin, yn(2)]  = SGD     (@(l) f(x(2 ), l), y(2) , a, eps   , lambda);
    [fin, yn(3)]  = Momentum(@(l) f(x(3 ), l), y(3) , a, lambda, gamma);
    [fin, yn(4)]  = NAC     (@(l) f(x(4 ), l), y(4) , a, lambda, gamma);
    [fin, yn(5)]  = Adagrad (@(l) f(x(5 ), l), y(5) , a, eps);
    [fin, yn(6)]  = Adadelta(@(l) f(x(6 ), l), y(6) , a, eps   , gamma);
    [fin, yn(7)]  = RMSProp (@(l) f(x(7 ), l), y(7) , a, eps);
    [fin, yn(8)]  = Adam    (@(l) f(x(8 ), l), y(8) , a, eps   , beta1 , beta2);
    [fin, yn(9)]  = AdaMax  (@(l) f(x(9 ), l), y(9) , a,         beta1 , beta2);
    [fin, yn(10)] = NAdam   (@(l) f(x(10), l), y(10), a, eps   , beta1 , beta2);
    [fin, yn(11)] = RAdam   (@(l) f(x(11), l), y(11), a, eps   , beta1 , beta2);
    
    % !! add here new optimizers !!
    
    zn = f(xn, yn);
    
    %% plot
    for i = 1:num_optimizers
        plot3([x(i), xn(i)], [y(i), yn(i)], [z(i), zn(i)], 'color', colors(:, i));
        set(xptr(i), 'XData', xn, 'YData', yn, 'ZData', zn);
    end
    x = xn; y = yn; z = zn;
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

fname = "batch.gif";
fprintf("Write animation to '%s'\n", fname);
imwrite(mov, map, fname, 'DelayTime', 0, 'LoopCount', inf);
