
# For WC scenario.
# Must match port state voltages of PST in dhm.upf UPF.

set_voltage 0.765 -object_list {vcc u_dhm_unit_0/u_dhm_core/vcc_sw0}
set_voltage 0.765 -object_list {vccL u_dhm_unit_1/u_dhm_core/vccL_sw1 u_dhm_unit_2/u_dhm_core/vccL_sw2 u_dhm_unit_2/u_dhm_core/vccL_sw3}
set_voltage 0.0 -object_list {vss}

# EOF
