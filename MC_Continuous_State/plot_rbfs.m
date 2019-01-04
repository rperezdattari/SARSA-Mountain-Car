[centroids, dev] = BuildStateList();  % the list of states
actionlist  = BuildActionList(); % the list of actions

nactions    = size(actionlist,1);
nstates     = size(centroids,1);
zero_init   = false;
%theta       = BuildTheta(centroids, nactions, zero_init);
load('results/value_evolution/test1000.mat', 'theta');
load('results/value_evolution/test9000.mat', 'visited_states');
visited_states_once = visited_states;
%visited_states_once(visited_states_once<200) = 0;
visited_states_once(visited_states_once>1) = 1;
V  = GetValueFunction(theta, centroids, dev);   
V_min = min(min(V));
%surf((V + abs(V_min)*ones(size(V))) .* visited_states_once') 
%surf(V)
surf(visited_states_once')
%colormap cool
shading interp