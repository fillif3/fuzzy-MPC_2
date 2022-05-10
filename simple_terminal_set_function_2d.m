function [c,ceq] = simple_terminal_set_function_2d(state,destination,min_dist)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
ceq=[];
dist=norm(state-destination);
c=dist-min_dist;

end