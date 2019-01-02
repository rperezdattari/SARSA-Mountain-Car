function [ V ] = GetValueFunction(theta, centroids, dev)

x_min = -1.5;
x_max = 0.5;
v_min = -0.07;
v_max = 0.07;

res = 30;
x = linspace(x_min, x_max, res);
v = linspace(v_min, v_max, res);

V = zeros(length(x), length(v));

for i = 1:length(x)
    for j = 1:length(v)
        [a, V(i, j)] = GetBestAction(theta, [x(i), v(j)], centroids, dev);
    end
end