function cost =compute_cost(trajectory,full_fuzzy_stage_cost,fuzzy_terminal_cost)
[cost,state]=full_fuzzy_stage_cost(trajectory);
cost=-cost-fuzzy_terminal_cost(state);