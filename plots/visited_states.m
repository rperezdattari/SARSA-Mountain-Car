clear all
addpath('../MC_Continuous_State')

load('../MC_Continuous_State/results/value_evolution/test9000.mat', 'visited_states');
visited_states_once = visited_states;
visited_states_once(visited_states_once>1) = 1;

%subplot(1, 2, 1)
surf(visited_states_once')
xlabel('Velocity', 'FontSize', 24)
ylabel('Position', 'FontSize', 24)
title('Explored States', 'FontSize', 24)
view(2)

%num_rbfs = 30;
%[centroids, dev] = BuildStateList(num_rbfs);  % the list of states

%subplot(1,2,2); 
%load('../MC_Continuous_State/results/value_evolution/test9000.mat', 'theta');
%V  = GetValueFunction(theta, centroids, dev);   
%surf(V)

%title('Value Function', 'FontSize', 14)

%xlabel('Velocity', 'FontSize', 14)
%ylabel('Position', 'FontSize', 14)
%zlabel('Value', 'FontSize', 14)

%view(2)
shading interp
