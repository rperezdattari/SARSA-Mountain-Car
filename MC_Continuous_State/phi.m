function [ phi ] = phi( s, centroids, dev )

phi = zeros(length(centroids), 1);
for i = 1:12
    phi(i) = exp(-abs(centroids(i) - s(1)) / (dev(1)^2));
end

for i = 13:24
    phi(i) = exp(-abs(centroids(i) - s(2)) / (dev(2)^2));
end