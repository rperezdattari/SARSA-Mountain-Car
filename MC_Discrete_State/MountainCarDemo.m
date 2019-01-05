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


trials      = 5;
maxsteps    = 1000;              % maximum number of steps per episode
statelist   = BuildStateList();  % the list of states
actionlist  = BuildActionList(); % the list of actions

nstates     = size(statelist,1);
nactions    = size(actionlist,1);

alpha       = 0.1;   % learning rate
gamma       = 1.0;   % discount factor
grafica     = false; % indicates if display the graphical interface

for trial=1:trials
    return_history = zeros(1, maxepisodes);
    Q = BuildQTable( nstates,nactions );  % the Qtable
    xpoints=[];
    ypoints=[];
    epsilon = 0.9;  % probability of a random action selection

    for i=1:maxepisodes    

        [total_reward,steps,Q ] = Episode( maxsteps, Q , alpha, gamma,epsilon,statelist,actionlist,grafica ); 
        return_history(i) = total_reward;

        disp(['Espisode: ',int2str(i),'  Steps:',int2str(steps),'  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon)])

        epsilon = epsilon * 0.99;

        xpoints(i)=i-1;
        ypoints(i)=steps;
        subplot(2,1,1);    
        plot(xpoints,ypoints)      
        title(['Episode: ',int2str(i),' epsilon: ',num2str(epsilon)])    
        drawnow

        if (i>300)
            grafica=true;
        end

        if mod(i, 10) == 0
            file_name = 'results/trial_%d_ncent_%d_alpha_%f.mat';
            save(sprintf(file_name, trial, 20, alpha), 'return_history')
        end
    end
end






