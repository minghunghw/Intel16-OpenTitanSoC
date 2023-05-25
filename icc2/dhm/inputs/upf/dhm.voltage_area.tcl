# dhm.voltage_area.tcl

# Boundaries of block & voltage areas for dhm design.
# Created on: 2013 Apr 10
# Updated on: 2016 Jan 31

#set INTEL_FP_BOUNDARY {{0 38.304} {0 143.640} {23.520 143.640} {23.520 191.520} {134.400 191.520} {134.400 134.064} {157.920 134.064} {157.920 49.476} {124.320 49.476} {124.320 0} {16.800 0} {16.800 38.304}}

#koshim aligned with grid
#create_voltage_area -power_domains u_dhm_unit_0/u_dhm_core/pd_core0 -region {{23.520 19.152} {23.520 44.688} {13.440 44.688} {13.440 86.184} {60.480 86.184} {60.480 19.152}} 
create_voltage_area -power_domains u_dhm_unit_0/u_dhm_core/pd_core0 -region {{23.6520 18.3600} {23.6520 44.2800} {13.5000 44.2800} {13.5000 84.2400} {60.3720 84.2400} {60.3720 18.3600}}

#km
create_voltage_area -power_domains pd_sleep1 -region {{10.0440 96.1200} {33.5880 133.9200}}

create_voltage_area -power_domains u_dhm_unit_1/u_dhm_core/pd_core1 -region {{46.9800 115.5600} {46.9800 150.1200} {30.2400 150.1200} {30.2400 178.2000} {124.2000 178.2000} {124.2000 140.4000} {90.6120 140.4000} {90.6120 115.5600}} 

create_voltage_area -power_domains u_dhm_unit_2/u_dhm_core/pd_core2 -region {{78.4080 28.0800} {78.4080 79.9200} {95.6880 79.9200} {95.6880 120.9600} {144.6120 120.9600} {144.6120 57.2400} {119.0160 57.2400} {119.0160 28.0800}}

create_voltage_area -power_domains u_dhm_unit_2/u_dhm_core/pd_core2_conv8 -region {{84.9960 29.1600} {117.5040 65.8800}}

create_voltage_area -power_domains u_dhm_unit_2/u_dhm_core/pd_core2_conv64 -region {{97.2000 75.6000} {141.1560 119.8800}}

## EOF
#
