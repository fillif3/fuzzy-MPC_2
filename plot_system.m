function plot_system(trajectory,state,horizon,number_of_inputs,system_model)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
states_x=zeros(horizon+1,1);
states_y=states_x;
states_x(1)=state(1);
states_y(1)=state(2);
plot(states_x,states_y,'*');
hold on

for i=1:horizon
    inputs=trajectory(((i-1)*number_of_inputs+1):(i*number_of_inputs))';
    state=system_model(inputs,state,[]);
    states_x(i+1)=state(1);
    states_y(i+1)=state(2);

end
plot(states_x,states_y);

end