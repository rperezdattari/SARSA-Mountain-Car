function [ Q ] = EvaluateQFunction( centroids, dev, theta, action, state )
% Select weights to use depending on the action

Q = phi(state, centroids, dev)' * theta(:, action);