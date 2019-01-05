function  MountainCarDemo( maxepisodes )
%MountainCarDemo, the main function of the demo
%maxepisodes: maximum number of episodes to run the demo

% Mountain Car Problem with SARSA 
% Programmed in Matlab 
% by:
%  Jose Antonio Martin H. <jamartinh@fdi.ucm.es>
% 
% See Sutton & Barto book: Reinforcement Learning p.214




clc
clf
set(gcf,'BackingStore','off')  % for realtime inverse kinematics
set(gcf,'name','Reinforcement Learning Mountain Car')  % for realtime inverse kinematics
set(gco,'Units','data')

trials = 5;                      % experiment repetitions
maxsteps    = 1000;              % maximum number of steps per episode
num_rbfs = 20;                   % number of RBFs for one state, total number of RBFs: N^state_dim * action_dim
[centroids, dev] = BuildStateList(num_rbfs);  % the center of the RBFs and their deviations are created
actionlist  = BuildActionList(); % the list of actions

nactions    = size(actionlist,1);
nstates     = size(centroids,1);

alpha       = 0.1;   % learning rate
gamma       = 0.99;   % discount factor
grafica     = false; % indicates if display the graphical interface
show_value = true;


for trial=1:trials
    visited_states = zeros(50, 50);             % states visited by the agent 
    return_history = zeros(1, maxepisodes);     % vector that collects the returns of every episode
    theta = BuildTheta(centroids, nactions);    % action value function weights
    xpoints=[];
    ypoints=[];
    epsilon = 0.9;  % probability of a random action selection
    
    for i=1:maxepisodes    

        [total_reward,steps,theta, visited_states ] = Episode( maxsteps, theta , alpha, gamma,epsilon,actionlist,grafica, centroids, dev, visited_states );    

        disp(['Espisode: ',int2str(i),'  Steps:',int2str(steps),'  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon)])

        epsilon = epsilon * 0.99; % 0.9996
        return_history(i) = total_reward;

        xpoints(i)=i-1;
        ypoints(i)=steps;
        subplot(3,1,1);    
        plot(xpoints,ypoints)      
        title(['Episode: ',int2str(i),' epsilon: ',num2str(epsilon)])    
        drawnow

        if (i>200)
            grafica=true;
        end
        
       % updates the value function every 10 episodes
        if mod(i, 10) == 0 && show_value 
            subplot(3,1,3); 
            V  = GetValueFunction(theta, centroids, dev);   
            surf(V)
            shading interp
        end

        % saves the experiment data every 100 episodes
        if mod(i, 100) == 0              
            file_name = 'results/trial_%d_nrbf_%d_alpha_%f.mat';
            save(sprintf(file_name, trial, num_rbfs, alpha), 'theta', 'visited_states', 'return_history')
        end
    end
end






