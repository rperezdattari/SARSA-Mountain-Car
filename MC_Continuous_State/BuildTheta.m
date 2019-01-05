function [ theta ] = BuildTheta(centroids, nactions)
%Initialize the weights of the action value function to zero 

theta = zeros(length(centroids),nactions);
