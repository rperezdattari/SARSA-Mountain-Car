clear all

addpath('../MC_Continuous_State')

num_rbfs = 30;
[centroids, dev] = BuildStateList(num_rbfs);  % the list of states
actionlist  = BuildActionList(); % the list of actions

nactions    = size(actionlist,1);
nstates     = size(centroids,1);

samples = [428, 12, 104, 1000, 9000];
title_name = 'Episode %d'; 
file_name = '../MC_Continuous_State/results/value_evolution/test%d.mat';

%x = fliplr(linspace(-1.2, 0.6, 50));
%v = linspace(-0.07, 0.07, 50);

for i=1:length(samples)
    subplot(1,5,i); 
    load(sprintf(file_name, samples(i)), 'theta');
    V  = GetValueFunction(theta, centroids, dev);   
    surf(V)
    if i == 1
        title('Step 428')
    else
        title(sprintf(title_name, samples(i)))
    end
    
    %xlabel('Velocity')
    %ylabel('Position')
    
    %axis([-0.07, 0.07, -1.2, 0.6, min(min(V)), max(max(V))])
    shading interp
    %view(3)
end
