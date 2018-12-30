function [ theta ] = BuildTheta(centroids, nactions)
%BuildStateList builds a state list from a state matrix

% state RBF representation for the mountain car problem
theta = zeros(length(centroids),nactions);