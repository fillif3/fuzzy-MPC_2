function [cost,state]= compute_fuzzy_stage_cost(trajectory,state,obstacles,fuzzy_stage_cost_per_step,system,horizon,number_of_inputs)
cost=0;
for i=1:(horizon)
    inputs=trajectory(((i-1)*number_of_inputs+1):(i*number_of_inputs))';
    [state,obstacles]=system(inputs,state,obstacles,[]);
    cost=cost+fuzzy_stage_cost_per_step(inputs,state,obstacles);
end


