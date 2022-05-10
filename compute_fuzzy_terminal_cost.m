function [cost,state]= compute_fuzzy_terminal_cost(control_law,state,obstacles,fuzzy_stage_cost_per_step,system,horizon)
cost=0;
for i=1:(horizon)
    inputs=control_law(state);
    [state,obstacles]=system(inputs,state,obstacles);
    cost=cost+fuzzy_stage_cost_per_step(inputs,state,obstacles);
end

