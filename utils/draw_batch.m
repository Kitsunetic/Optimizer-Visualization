function draw_batch(graph, f, axis_limit, x, y, p, enabled, num_iteration)
%
addpath('./optimizer');

%% initialize variables
optimizer_names = [
    "GD",
    "SGD",
    "Momentum",
    "NAG",
    "Adagrad",
    "Adadelta",
    "RMSprop",
    "Adam",
    "AdaMax",
    "NAdam",
    "RAdam"
];
num_optimizers = length(optimizer_names);
z = f(x, y);
%colors = rand(3, num_optimizers);
colors = [
    0, 0, 0;
    0, 0, 1;
    0, 1, 0;
    0, 1, 1;
    1, 0, 0;
    1, 0, 1;
    1, 1, 0;
    0.5, 0.5, 0.5;
    0.5, 0.5, 1;
    0.7, 1, 0.3;
    0.7, 0.4, 1
]';
xn = zeros(1, num_optimizers);
yn = zeros(1, num_optimizers);
zn = zeros(1, num_optimizers);
converge = zeros(1, num_optimizers);

% draw graph outine
t_x = linspace(axis_limit(1), axis_limit(2), 100);
t_y = linspace(axis_limit(3), axis_limit(4), 100);
[X, Y] = meshgrid(t_x, t_y);
Z = f(X, Y);
meshc(graph, X, Y, Z);
alpha(0.1);
axis(graph, axis_limit);
hold on;

% draw pointer
ptr = zeros(1, num_optimizers);
for k = 1:num_optimizers
    if enabled(k)
        %ptr(k) = plot3(graph, x(k), y(k), z(k), 'color', colors(:, k), 'marker', 'o');
    end
end

% do iteration
for k = 1:num_iteration
    % calculate next step
    if enabled(1)
        [fin, xn(1)]  = GD      (@(l) f(l, y(1 )), x(1) , p(1 , 1)                                  );
        [fin, yn(1)]  = GD      (@(l) f(x(1 ), l), y(1) , p(1 , 1)                                  );
    end
    if enabled(2)
        [fin, xn(2)]  = SGD     (@(l) f(l, y(2 )), x(2) , p(2 , 1), p(2, 4) , p(2, 2)               );
        [fin, yn(2)]  = SGD     (@(l) f(x(2 ), l), y(2) , p(2 , 1), p(2, 4) , p(2, 2)               );
    end
    if enabled(3)
        [fin, xn(3)]  = Momentum(@(l) f(l, y(3 )), x(3) , p(3 , 1),           p(3, 2)  , p(3, 3)    );
        [fin, yn(3)]  = Momentum(@(l) f(x(3 ), l), y(3) , p(3 , 1),           p(3, 2)  , p(3, 3)    );
    end
    if enabled(4)
        [fin, xn(4)]  = NAG     (@(l) f(l, y(4 )), x(4) , p(4 , 1),           p(4, 2)  , p(4, 3)    );
        [fin, yn(4)]  = NAG     (@(l) f(x(4 ), l), y(4) , p(4 , 1),           p(4, 2)  , p(4, 3)    );
    end
    if enabled(5)
        [fin, xn(5)]  = Adagrad (@(l) f(l, y(5 )), x(5) , p(5 , 1), p(5, 4)                         );
        [fin, yn(5)]  = Adagrad (@(l) f(x(5 ), l), y(5) , p(5 , 1), p(5, 4)                         );
    end
    if enabled(6)
        [fin, xn(6)]  = Adadelta(@(l) f(l, y(6 )), x(6) , p(6 , 1), p(6, 4) ,            p(6, 3)    );
        [fin, yn(6)]  = Adadelta(@(l) f(x(6 ), l), y(6) , p(6 , 1), p(6, 4) ,            p(6, 3)    );
    end
    if enabled(7)
        [fin, xn(7)]  = RMSProp (@(l) f(l, y(7 )), x(7) , p(7 , 1), p(7, 4)                         );
        [fin, yn(7)]  = RMSProp (@(l) f(x(7 ), l), y(7) , p(7 , 1), p(7, 4)                         );
    end
    if enabled(8)
        [fin, xn(8)]  = Adam    (@(l) f(l, y(8 )), x(8) , p(8 , 1), p(8, 4) , p(8 , 5) , p(8 , 6)   );
        [fin, yn(8)]  = Adam    (@(l) f(x(8 ), l), y(8) , p(8 , 1), p(8, 4) , p(8 , 5) , p(8 , 6)   );
    end
    if enabled(9)
        [fin, xn(9)]  = AdaMax  (@(l) f(l, y(9 )), x(9) , p(9 , 1),           p(9 , 5) , p(9 , 6)   );
        [fin, yn(9)]  = AdaMax  (@(l) f(x(9 ), l), y(9) , p(9 , 1),           p(9 , 5) , p(9 , 6)   );
    end
    if enabled(10)
        [fin, xn(10)] = NAdam   (@(l) f(l, y(10)), x(10), p(10, 1), p(10, 4), p(10, 5) , p(10, 6)   );
        [fin, yn(10)] = NAdam   (@(l) f(x(10), l), y(10), p(10, 1), p(10, 4), p(10, 5) , p(10, 6)   );
    end
    if enabled(11)
        [fin, xn(11)] = RAdam   (@(l) f(l, y(11)), x(11), p(11, 1), p(11, 4), p(11, 5) , p(11, 6)   );
        [fin, yn(11)] = RAdam   (@(l) f(x(11), l), y(11), p(11, 1), p(11, 4), p(11, 5) , p(11, 6)   );
    end
    zn = f(xn, yn);
    
    % plot
    for k = 1:num_optimizers
        if enabled(k)
            plot3(graph, [x(k), xn(k)], [y(k), yn(k)], [z(k), zn(k)], 'color', colors(:, k), 'LineWidth', 3);
            %set(ptr(k), 'XData', xn, 'YData', yn, 'ZData', zn);
        end
    end
    x = xn; y = yn; z = zn;
    drawnow;
end
hold off;
