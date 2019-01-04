function [ phi ] = phi( s, centroids, dev )

phi = zeros(length(centroids), 1);
for i = 1:length(centroids)
    rbf1 = exp(-abs(centroids(i, 1) - s(1)) / (2 * dev(1)^2));
    rbf2 = exp(-abs(centroids(i, 2) - s(2)) / (2 * dev(2)^2));
    phi(i) = rbf1 * rbf2;
end
phi = phi/sum(phi);