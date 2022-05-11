function draw_system_with_obstacles(iteration,number_of_past_states,state_history,destination,obstacles,min_radius,max_radius)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
past_index = max(1,iteration-number_of_past_states);
plot(state_history(past_index:iteration,1),state_history(past_index:iteration,2))
hold on 
plot(destination(1),destination(2),'*');
for obs=obstacles
    o=obs{1};
    plot_circle(o(1),o(2),min_radius,'r');
    plot_circle(o(1),o(2),max_radius,'g');
end
hold off
drawnow
end