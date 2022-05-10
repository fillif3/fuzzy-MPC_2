function out = fuzzy_cost_trapezoid(x,a,b)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
out=min(1,max(0,1-(abs(x)-a)/(b-a)));
end