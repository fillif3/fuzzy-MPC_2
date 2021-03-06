%% preperation
rng('default')
% 1-> 2_D linear
% 2-> mobile robot with direction
the_case=1;

% Main parameters

NUMBER_OF_ITERATIONS=50;
discretization_time=0.1;
drawing_flag=true;
Space_size=10;
needed_time=zeros(6,1);
for qwe=5:10
    if the_case==1
        % System parameters
        NUMBER_OF_STATES=2;
        NUMBER_OF_INPUTS=2;
        state=[3;2];%rand([NUMBER_OF_STATES,1])*3;
        system_model = @(u,x,o,obstacles_noise) simple_2d_system_with_dynamic_obstacles(u,x,o,obstacles_noise);
        target_velocity=0.5;
        max_velocity=1;
        min_distance=0.1;
        safe_distance=1;
        obstacles={[1;0;0;0.2],[1;1;0;-0.1]};
        unbiased_noises={[0.02;0.02;0.05;0.05],[0.02;0.02;0.05;0.05]};

        % Trajectory
        
        destination =zeros([NUMBER_OF_STATES,1]);
        terminal_set_function = @(state) simple_terminal_set_function_2d(state,destination,1);
        weigths=[1,1,1];
        % MPC parameters
    
        horizon=qwe;
        terminal_horizon=1;
    
    elseif the_case==2
            % System parameters
        TODO=1;
    
    end
    
    
    %   Detailed explanation goes here
    state_history=zeros(NUMBER_OF_ITERATIONS,length(state));
    state_estimation=state;
    
    
    
    % simulation
    for i=1:NUMBER_OF_ITERATIONS
        tic
        [input,path]=fuzzy_MPC_path_planning(state,obstacles,destination,system_model,NUMBER_OF_INPUTS,...
            horizon,terminal_horizon,Space_size,terminal_set_function,target_velocity,max_velocity,min_distance,safe_distance,weigths,1);
        needed_time(qwe-4) =needed_time(qwe-4) +toc;
        %[state,obstacles,measurments]=simulate(input);
        [state,obstacles]=system_model(input,state,obstacles,unbiased_noises);
        
    
        %TO DO - Add noise
        state_estimation=state;
        state_history(i,:)=state;    
        %Drawing
        if drawing_flag
            draw_system_with_obstacles(i,1000,state_history,destination,obstacles,min_distance,safe_distance)
        end
    end
    disp(needed_time)
end
needed_time=needed_time/5;

