function [ theta ] = BuildTheta(centroids, nactions, zero_init)
%BuildStateList builds a state list from a state matrix

% state RBF representation for the mountain car problem
if zero_init
    theta = zeros(length(centroids),nactions);
else
    theta = ones(length(centroids),nactions);
end