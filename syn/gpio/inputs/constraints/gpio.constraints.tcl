
set_max_fanout 16 [current_design]
set_max_transition 200 [current_design]

set nonclock_input_ports [remove_from_collection [all_inputs] [get_ports clk_i]]
set_input_delay -clock virtual_clk -max 100 $nonclock_input_ports
set_input_delay -clock virtual_clk -min 50 $nonclock_input_ports
set_driving_cell -lib_cell b15bfn000ah1n12x5 -input_transition_rise 100 -input_transition_fall 100 $nonclock_input_ports

set_output_delay -clock virtual_clk -max 100 [all_outputs]
set_output_delay -clock virtual_clk -min 50 [all_outputs]
set_load [expr [load_of [get_lib_pins */b15bfn000ah1n12x5/a]] * 4] [all_outputs]

## --------------------------------------------------------------------------
## End of file
## --------------------------------------------------------------------------