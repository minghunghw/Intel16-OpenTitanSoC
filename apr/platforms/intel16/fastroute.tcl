set_global_routing_layer_adjustment m2 0.5 
set_global_routing_layer_adjustment m3-m7 0.3
set_routing_layers -signal $::env(MIN_ROUTING_LAYER)-$::env(MAX_ROUTING_LAYER) -clock m3-$::env(MAX_ROUTING_LAYER) 
set_macro_extension 2
