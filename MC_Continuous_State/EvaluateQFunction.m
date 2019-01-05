function [ Q ] = EvaluateQFunction( centroids, dev, theta, action, state )
% Evaluate estimated action value. Dot product between phi and theta.  

Q = phi(state, centroids, dev)' * theta(:, action); % only weights associated with action_{i} are activated