function [ a ] = e_greedy_selection( theta , s, epsilon, centroids, dev )
% e_greedy_selection selects an action using Epsilon-greedy strategy
% Q: the Qtable
% s: the current state

actions = size(theta,2);
if (rand()>epsilon) 
    [a, max_Q] = GetBestAction(theta,s, centroids, dev);    
else
    % selects a random action based on a uniform distribution
    % +1 because randint goes from 0 to N-1 and matlab matrices goes from
    % 1 to N
    a = randi(actions);
end

