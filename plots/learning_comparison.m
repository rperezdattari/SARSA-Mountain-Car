clear all

trials = 5;
rbf_returns_means = [];
num_cents = [3, 6, 10, 20];
smooth_window_size = 40;
init = ones(1, smooth_window_size) * -1000; % padding
colors = [[0, 0.4470, 0.7410]; [0.8500, 0.3250, 0.0980]; [0.9290, 0.6940, 0.1250]; [0.4940, 0.1840, 0.5560]];
for i=1:length(num_cents) 
    rbf_returns = [];
   for j=1:trials
       file_name = '../MC_Continuous_State/results/state_space_comparison/trial_%d_nrbf_%d_alpha_0.100000.mat';
       load(sprintf(file_name, j, num_cents(i)), 'return_history')
       final = ones(1, smooth_window_size) * return_history(length(return_history)); %padding
       rbf_returns = [rbf_returns; init, return_history, final];
   end
   rbf_returns_means = [rbf_returns_means; mean(rbf_returns)];
end

for i=1:length(num_cents)
    smoothed_curve = smoothts(rbf_returns_means(i, :), 'b', smooth_window_size);
    plot(smoothed_curve(smooth_window_size + 1:length(smoothed_curve)-smooth_window_size), 'LineWidth', 4, 'Color', colors(i, :))
    %plot(rbf_returns_means(i, :))
    hold on
end

table_returns_means = [];
for i=1:length(num_cents)
    table_returns = [];
   for j=1:trials
       file_name = '../MC_Discrete_State/results/comparison/trial_%d_ncent_%d_alpha_0.100000.mat';
       load(sprintf(file_name, j, num_cents(i)), 'return_history')
       final = ones(1, smooth_window_size) * return_history(length(return_history)); %padding
       table_returns = [table_returns; init, return_history, final];
   end
   table_returns_means = [table_returns_means; mean(table_returns)];
end

for i=1:length(num_cents)
    smoothed_curve = smoothts(table_returns_means(i, :), 'b', smooth_window_size);
    plot(smoothed_curve(smooth_window_size + 1:length(smoothed_curve)-smooth_window_size), 'LineWidth', 4, 'LineStyle', '--', 'Color', colors(i, :))
    %plot(table_returns_means(i, :))
    hold on
end

legend({'RBFs, Centers: 3x3', 'RBFs, Centers: 6x6', 'RBFs, Centers: 10x10', 'RBFs, Centers: 20x20', 'Table, Centers: 3x3', 'Table, Centers: 6x6', 'Table, Centers: 10x10', 'Table, Centers: 20x20'}, 'FontSize', 22)
title('Learning Curves: RBFs vs Table', 'FontSize', 24)
xlabel('Episode', 'FontSize', 24)
ylabel('Return', 'FontSize', 24)
grid on