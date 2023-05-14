
`ifndef __UPF_REAL_CONVERSION_PKG__
`define __UPF_REAL_CONVERSION_PKG__

`timescale 1ns/1ps

package upf_real_conversion_pkg;

    import UPF::*;

    function real supply_net_to_real(supply_net_type supply_net);
   // function real supply_net_to_real(V_voltage , voltage);
        int V_voltage;
        real voltage;
        V_voltage   = supply_net.voltage;
        voltage     = ($itor(V_voltage) / 1000000);
        return voltage;
    endfunction : supply_net_to_real
       
    function void real_to_supply_net(input real voltage,
                                     ref supply_net_type supply_net,
                                     input real ON_min_voltage_threshold = 0.81,
                                     input real ON_max_voltage_threshold = 1.32);
        real uV_voltage;
        int voltage_int;
        int ON_min_threshold_int;
        int ON_max_threshold_int;

        uV_voltage          = (voltage * 1000000);
        voltage_int         = $rtoi(uV_voltage);
        supply_net.voltage  = voltage_int;
        ON_min_threshold_int    = $rtoi(ON_min_voltage_threshold * 1000000);
        ON_max_threshold_int    = $rtoi(ON_max_voltage_threshold * 1000000);

        if ((voltage_int >= ON_min_threshold_int) && (voltage_int <= ON_max_threshold_int))
            supply_net.state = FULL_ON;
        else
            supply_net.state = OFF;

    endfunction : real_to_supply_net

endpackage : upf_real_conversion_pkg

// In order to be able to use includes and make integration in RTL easy in ACE

import UPF::*;
import upf_real_conversion_pkg::*;

`endif //__UPF_REAL_CONVERSION_PKG__
