function [input,path]=fuzzy_MPC_path_planning(state,obstacle,destination,system_model,NUMBER_OF_INPUTS,...
        horizon,terminal_horizon,Space_size,terminal_set,target_velocity,max_linear_velocity,min_disttance,safe_distance,weigths,discretezation_input_space)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% Preapre fuzzy cost function
fuzzy_cost_destination= @(state) fuzzy_cost_gauss(norm(destination-state),0,10)^weigths(1);
fuzzy_cost_velocity= @(input) fuzzy_cost_trapezoid(norm(input),target_velocity,max_linear_velocity)^weigths(2);
fuzzy_cost_obstacles= @(state,obstacle)(1- fuzzy_cost_trapezoid(norm(state-obstacle(1:2)),min_disttance,safe_distance))^weigths(3);
fuzzy_stage_cost_per_step= @(input,state,obstacle) fuzzy_stage_cost(input,state,obstacle,fuzzy_cost_destination,fuzzy_cost_velocity,fuzzy_cost_obstacles);
full_fuzzy_stage_cost= @(trajectory) compute_fuzzy_stage_cost(trajectory,state,obstacle,fuzzy_stage_cost_per_step,system_model,horizon,NUMBER_OF_INPUTS);
terminal_control_law = @(state) destination-state;
fuzzy_terminal_cost= @(state) compute_fuzzy_terminal_cost(terminal_control_law,state,[],fuzzy_stage_cost_per_step,system_model,terminal_horizon);
full_cost_function = @(trajectory) compute_cost(trajectory*discretezation_input_space,full_fuzzy_stage_cost,fuzzy_terminal_cost);

lb=-ones(horizon*NUMBER_OF_INPUTS,1)*max_linear_velocity/discretezation_input_space;
ub=-lb;

nonlocon_function = @(trajectory) check_if_in_terminal_set(trajectory*discretezation_input_space,state,terminal_set,horizon,NUMBER_OF_INPUTS,system_model);
intcon =[];% 1:min(horizon*NUMBER_OF_INPUTS/2,7);
options = optimoptions('ga','Display','off');
[path,FVAL,EXITFLAG,OUTPUT] = ga(full_cost_function,horizon*NUMBER_OF_INPUTS,[],[],[],[],lb,ub,nonlocon_function,intcon,options);
%disp(FVAL)
if EXITFLAG<0
    disp(FVAL)
    %error(OUTPUT)
end
path=path*discretezation_input_space;
%plot_system(path,state,horizon,NUMBER_OF_INPUTS,system_model)
input=path(1:NUMBER_OF_INPUTS)';


end


