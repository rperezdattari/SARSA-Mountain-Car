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
[centroids, dev] = BuildStateList();  % the list of states
actionlist  = BuildActionList(); % the list of actions

nactions    = size(actionlist,1);
nstates     = size(centroids,1);
zero_init   = true;
theta       = BuildTheta(centroids, nactions, zero_init); 

alpha       = 0.1;   % learning rate
gamma       = 0.99;   % discount factor
epsilon     = 0.9;  % probability of a random action selection
grafica     = false; % indicates if display the graphical interface

xpoints=[];
ypoints=[];

visited_states = zeros(50, 50);
return_history = zeros(1, maxepisodes);

for i=1:maxepisodes    
    
    [total_reward,steps,theta, visited_states ] = Episode( maxsteps, theta , alpha, gamma,epsilon,actionlist,grafica, centroids, dev, visited_states );    
    
    disp(['Espisode: ',int2str(i),'  Steps:',int2str(steps),'  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon)])
    
    epsilon = epsilon * 0.9996; % 0.9996
    return_history(i) = total_reward;
    
    xpoints(i)=i-1;
    ypoints(i)=steps;
    subplot(3,1,1);    
    plot(xpoints,ypoints)      
    title(['Episode: ',int2str(i),' epsilon: ',num2str(epsilon)])    
    drawnow
    
    if (i>10000)
        grafica=true;
    end
    
    %if mod(i, 12) == 0
     %   subplot(3,1,3); 
      %  V  = GetValueFunction(theta, centroids, dev);   
       % surf(V)
        %shading interp
        %save('results/test12.mat', 'theta', 'visited_states', 'return_history')
   % end
    
    if i == 12
        subplot(3,1,3); 
        V  = GetValueFunction(theta, centroids, dev);   
        surf(V)
        shading interp
        save('results/test12.mat', 'theta', 'visited_states', 'return_history')
    end
    
    if i == 104
        subplot(3,1,3); 
        V  = GetValueFunction(theta, centroids, dev);   
        surf(V)
        shading interp
        save('results/test104.mat', 'theta', 'visited_states', 'return_history')
    end
    
    if i == 1000
        subplot(3,1,3); 
        V  = GetValueFunction(theta, centroids, dev);   
        surf(V)
        shading interp
        save('results/test1000.mat', 'theta', 'visited_states', 'return_history')
    end
    
    if i == 9000
        subplot(3,1,3); 
        V  = GetValueFunction(theta, centroids, dev);   
        surf(V)
        shading interp
        save('results/test9000.mat', 'theta', 'visited_states', 'return_history')
    end
    
    if mod(i, 100) == 0
        save('results/test.mat', 'theta', 'visited_states', 'return_history')
    end
end






