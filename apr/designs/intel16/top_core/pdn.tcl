#################################### 
# global connections 
#################################### 
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {vcc}  -power 
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {vddp}
add_global_connection -net {VSS} -inst_pattern {.*} -pin_pattern {vssx} -ground 
add_global_connection -net {VSS} -inst_pattern {.*} -pin_pattern {vss}
global_connect

#################################### 
# voltage domains
#################################### 
set_voltage_domain -name {CORE} -power {VDD} -ground {VSS}

####################################
# standard cell grid 
#################################### 
define_pdn_grid -name {grid} -voltage_domains {CORE}

add_pdn_stripe -grid {grid} -layer {m1} -width {0.044} -followpins 
add_pdn_stripe -grid {grid} -layer {m2} -width {0.044} -followpins

add_pdn_ring -grid {grid} -layer {gmz gm0} -widths {6 6} -spacings {1 1} -core_offsets {1 1}

add_pdn_stripe -grid {grid} -layer {m3} -width {0.044} -pitch {1.080} -offset {2.304} -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {m4} -width {0.044} -pitch {1.080} -offset {3.240} -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {m5} -width {0.044} -pitch {1.080} -offset {2.304} -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {m6} -width {0.160} -pitch {2.160} -offset {3.240} -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {m7} -width {0.180} -pitch {4.320} -offset {1.765} -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {m8} -width {0.180} -pitch {4.320} -offset {1.765} -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {gmz} -width {0.540} -pitch {4.320} -offset {1.765} -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {gm0} -width {6.000} -pitch {51.84} -offset {25.92} -extend_to_core_ring

add_pdn_connect -grid {grid} -layers {m1 m2} -dont_use_vias ".*_illegal" -ongrid {m1}
add_pdn_connect -grid {grid} -layers {m2 m3} -dont_use_vias ".*_illegal" 
add_pdn_connect -grid {grid} -layers {m3 m4} -dont_use_vias ".*_illegal" 
add_pdn_connect -grid {grid} -layers {m4 m5} -dont_use_vias ".*_illegal" 
add_pdn_connect -grid {grid} -layers {m5 m6} -dont_use_vias ".*_illegal" 
add_pdn_connect -grid {grid} -layers {m6 m7} -dont_use_vias ".*_illegal"
add_pdn_connect -grid {grid} -layers {m7 m8} -dont_use_vias ".*_illegal"
add_pdn_connect -grid {grid} -layers {m8 gmz} -dont_use_vias ".*_illegal"
add_pdn_connect -grid {grid} -layers {gmz gm0} -dont_use_vias ".*_illegal"

####################################
# macro grids 
#################################### 
define_pdn_grid -name {macro_grid} -voltage_domains {CORE} -macro -orient {R0 R180 MX MY} -halo {2.0 2.0 2.0 2.0} -default -grid_over_boundary
add_pdn_connect -grid {macro_grid} -layers {m4 m5}