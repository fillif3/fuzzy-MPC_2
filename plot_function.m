function [outputArg1,outputArg2] = plot_function(size,max,func,zero_second_input_flag)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
t=0:0.1:max;
outputs=zeros(length(t),1);
for i=1:length(t)
    if zero_second_input_flag
        outputs(i)=func(ones(size)*t(i),zeros(size));
    else
        outputs(i)=func(ones(size)*t(i));
    end
end
plot(t,outputs)
    
end