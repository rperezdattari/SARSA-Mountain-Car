function [ a, maxQ ] = GetBestAction( theta, s, centroids, dev )
%GetBestAction return the best action for state (s)
% Evaluates the Q function over all the actions and selects the one that
% maxQ

nactions = size(theta, 2);
maxQ = -1e30;
max_i = -1;

for i = 1:nactions
    action = i;
    Q_value = EvaluateQFunction(centroids, dev, theta, action, s);
    
    if Q_value > maxQ
        maxQ = Q_value;
        max_i = i;
    end
end

maxQ = -maxQ; % return -maxQ because this value is only used for the cost-to-go function
a = max_i;