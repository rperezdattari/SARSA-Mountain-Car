function [ a ] = GetBestAction( theta, s, centroids, dev )
%GetBestAction return the best action for state (s)
%Q: the Qtable
%s: the current state
% Q has structure  Q(states,actions)

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

a = max_i;