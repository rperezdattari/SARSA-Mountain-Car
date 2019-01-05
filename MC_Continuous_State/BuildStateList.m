function [ centers, dev ] = BuildStateList(num_rbfs)
% Generates the centers and dev of the basis functions
x = linspace(0, 1, num_rbfs); % normalized state space
xp = linspace(0, 1, num_rbfs);

centers = zeros(length(x) * length(xp), 2);

counter = 1;
for i = 1:length(x)
    for j = 1:length(xp)
        centers(counter, :) = [x(i), xp(j)];
        counter = counter + 1;
    end
end
dev = [(x(2) - x(1)), (xp(2) - xp(1))] * 1.0; % same deviation + normalized state + diagonal covariance -> spherical RBFs 
