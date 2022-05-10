function [c,ceq] = check_if_in_terminal_set(trajectory,state,terminal_set_distance_function,horizon,number_of_inputs,system_function)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i=1:(horizon-1)
    inputs=trajectory(((i-1)*number_of_inputs+1):(i*number_of_inputs))';
    [state,~]=system_function(inputs,state,[]);
    
end
[c,ceq]=terminal_set_distance_function(state);

end