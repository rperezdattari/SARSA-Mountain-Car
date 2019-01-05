function [ V ] = GetValueFunction(theta, centroids, dev)
% Generates a matrix of the Cost-to-go function by discretizing the state space 

x_min = 0;
x_max = 1;
v_min = 0;
v_max = 1;

res = 50; % resolution of the matrix
x = fliplr(linspace(x_min, x_max, res)); % discretized x
v = linspace(v_min, v_max, res);         % discretized v

V = zeros(length(x), length(v));

for i = 1:length(x)
    for j = 1:length(v)
        [a, V(i, j)] = GetBestAction(theta, [x(i), v(j)], centroids, dev); % fill cost-to-go matrix
    end
end