function [ centers, dev ] = BuildStateList()
%BuildStateList builds a state list from a state matrix

% state RBF representation for the mountain car problem
rbf_1 = 30.0; %70
rbf_2 = 30.0; %35
%x = linspace(-1.2, 0.6, rbf_1);
%xp = linspace(-0.07, 0.07, rbf_2);

x = linspace(0, 1, rbf_1);
xp = linspace(0, 1, rbf_2);

centers = zeros(length(x) * length(xp), 2);

counter = 1;
for i = 1:length(x)
    for j = 1:length(xp)
        centers(counter, :) = [x(i), xp(j)];
        counter = counter + 1;
    end
end
dev = [(x(2) - x(1)), (xp(2) - xp(1))] * 1.0; %[0.1, 0.03]*5.0; 12

%dev = [2/rbf_1, 0.14/rbf_2]*30.0;
