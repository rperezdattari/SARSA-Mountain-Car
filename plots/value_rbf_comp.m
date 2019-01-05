clear all

addpath('../MC_Continuous_State')

title_name = '# RBFs: %dx%d'; 
alphas = ['005';
    '010';
    '010'];
rbf_n = [10, 20, 30];
file_name = '../MC_Continuous_State/results/rbf_num_comparison/test_a%s_rbf%d_dev1.mat';

for i=1:3
    num_rbfs = rbf_n(i);
    [centroids, dev] = BuildStateList(num_rbfs);  % the list of states

    subplot(1,3,i); 
    if i==3
        load('../MC_Continuous_State/results/value_evolution/test9000.mat', 'theta')
    else
        load(sprintf(file_name, alphas(i, :), rbf_n(i)), 'theta');
    end
    V  = GetValueFunction(theta, centroids, dev);   
    surf(V)

    title(sprintf(title_name, rbf_n(i), rbf_n(i)), 'FontSize', 24)
    
    xlabel('Velocity', 'FontSize', 16)
    ylabel('Position', 'FontSize', 16)
    zlabel('Value', 'FontSize', 16)
    
    shading interp
    %view(2)
end