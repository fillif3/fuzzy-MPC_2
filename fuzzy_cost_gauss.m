function out = fuzzy_cost_gauss(x,u,sigma)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
out=exp(-abs(x-u)/sigma);
end