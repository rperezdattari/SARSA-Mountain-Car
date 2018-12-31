function [ Q ] = EvaluateQFunction( centroids, dev, theta, action, state )
% Select weights to use depending on the action
rbf_eval = zeros(length(centroids), 1);
for i = 1:12
    rbf_eval(i) = exp(-abs(centroids(i) - state(1)) / dev(1)^2);
end

for i = 13:24
    rbf_eval(i) = exp(-abs(centroids(i) - state(2)) / dev(2)^2);
end

Q = rbf_eval' * theta(:, action);