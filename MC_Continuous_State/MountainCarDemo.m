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


maxsteps    = 1000;              % maximum number of steps per episode
[centroids, dev]   = BuildStateList();  % the list of states
actionlist  = BuildActionList(); % the list of actions

nactions    = size(actionlist,1);
nstates     = size(centroids,1);
theta       = BuildTheta(centroids, nactions); 

alpha       = 0.001;   % learning rate
gamma       = 0.99;   % discount factor
epsilon     = 0.9;  % probability of a random action selection
grafica     = false; % indicates if display the graphical interface

xpoints=[];
ypoints=[];

for i=1:maxepisodes    
    
    [total_reward,steps,theta ] = Episode( maxsteps, theta , alpha, gamma,epsilon,actionlist,grafica, centroids, dev );    
    
    disp(['Espisode: ',int2str(i),'  Steps:',int2str(steps),'  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon)])
    
    epsilon = epsilon * 0.99;
    
    xpoints(i)=i-1;
    ypoints(i)=steps;
    subplot(2,1,1);    
    plot(xpoints,ypoints)      
    title(['Episode: ',int2str(i),' epsilon: ',num2str(epsilon)])    
    drawnow
    
    if (i>299)
        grafica=true;
    end
end






