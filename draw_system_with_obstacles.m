function draw_system_with_obstacles(iteration,number_of_past_states,state_history,destination,obstacles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
past_index = max(1,iteration-number_of_past_states);
plot(state_history(past_index:iteration,1),state_history(past_index:iteration,2))
hold on 
plot(destination(1),destination(2),'*');
hold off
drawnow
end