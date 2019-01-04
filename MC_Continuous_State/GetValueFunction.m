function [ V ] = GetValueFunction(theta, centroids, dev)

%x_min = -1.2;
%x_max = 0.6;
%v_min = -0.07;
%v_max = 0.07;

x_min = 0;
x_max = 1;
v_min = 0;
v_max = 1;

res = 50;
x = fliplr(linspace(x_min, x_max, res));
v = linspace(v_min, v_max, res);

V = zeros(length(x), length(v));

%for i = 1:900
%    if abs(sum(theta(i, :))) > 1
%        theta(i, :) = theta(i, :) - 1e5; 
%    end
%end

for i = 1:length(x)
    for j = 1:length(v)
        [a, V(i, j)] = GetBestAction(theta, [x(i), v(j)], centroids, dev);
    end
end

%V_min = min(min(V));

%index = 1;
%for i = 1:900
%    if sum(theta(i, :)) < 1e-2
%        index = index + 1
%    end
%end