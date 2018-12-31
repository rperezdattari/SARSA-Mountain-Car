function [ centroids, dev ] = BuildStateList()
%BuildStateList builds a state list from a state matrix

% state RBF representation for the mountain car problem
num_rbf_per_dim = 12.0;

x = linspace(-1.5, 0.5, num_rbf_per_dim);
xp = linspace(-0.07, 0.07, num_rbf_per_dim);
dev = [0.5 + 1.5, 0.07 + 0.07];

centroids = [x, xp];
