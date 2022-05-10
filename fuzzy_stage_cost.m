function cost = fuzzy_stage_cost(input,state,obstacles,fuzzy_cost_destination,fuzzy_cost_velocity,fuzzy_cost_obstacles)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
cost = fuzzy_cost_destination(state);
cost=min(cost,fuzzy_cost_velocity(input));
for i=1:length(obstacles)
    cost=min(cost,fuzzy_cost_obstacles(state,obstacles{1}));
end
cost=log(cost);
end