function [state,obstacles] = simple_2d_system_with_dynamic_obstacles(input,state,obstacles)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
state=input+state;
for i=1:length(obstacles)
    obstacle=obstacles{i};
    obstacle(1:2)=obstacle(1:2)+obstacle(3:4);
    obstacles{i}=obstacle;
end

end