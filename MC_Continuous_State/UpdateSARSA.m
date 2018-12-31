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

rbf_eval = zeros(length(centroids), 1);
for i = 1:12
    rbf_eval(i) = exp(-abs(centroids(i) - s(1)) / (dev(1)^2));
end

for i = 13:24
    rbf_eval(i) = exp(-abs(centroids(i) - s(2)) / (dev(2)^2));
end

theta(:, a) =  theta(:,a) + alpha * ( r + gamma*Qp - Q ) * rbf_eval;