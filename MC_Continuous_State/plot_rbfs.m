[centroids, dev] = BuildStateList();  % the list of states
actionlist  = BuildActionList(); % the list of actions

nactions    = size(actionlist,1);
nstates     = size(centroids,1);
zero_init   = false;
theta       = BuildTheta(centroids, nactions, zero_init); 

V  = GetValueFunction(theta, centroids, dev);   
surf(-V)
shading interp