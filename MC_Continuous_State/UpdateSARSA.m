function [ theta ] = UpdateSARSA( s, a, r, sp, ap, theta , alpha, gamma, centroids, dev )
% UpdateQ update de Qtable and return it using Whatkins QLearing
% s1: previous state before taking action (a)
% s2: current state after action (a)
% r: reward received from the environment after taking action (a) in state
%                                             s1 and reaching the state s2
% a:  the last executed action
% tab: the current Qtable
% alpha: learning rate
% gamma: discount factor
% Q: the resulting Qtable

Qp = EvaluateQFunction( centroids, dev, theta, ap, sp );
Q = EvaluateQFunction( centroids, dev, theta, a, s );

theta(:, a) =  theta(:,a) + alpha * ( r + gamma*Qp - Q ) * phi(s, centroids, dev);