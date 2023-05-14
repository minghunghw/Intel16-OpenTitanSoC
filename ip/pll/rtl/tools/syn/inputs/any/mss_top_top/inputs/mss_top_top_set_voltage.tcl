##---------------------
## set IP assumptions of supply voltages, which may be overriden by the customer
##---------------------
if { ![info exists MSS_TOP_SUPPLY_NOM] } {
    set MSS_TOP_SUPPLY_NOM 1.10
}
eval set_voltage -object "vdd" $MSS_TOP_SUPPLY_NOM
eval set_voltage -object "vss" 0.0
