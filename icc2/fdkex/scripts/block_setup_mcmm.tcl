set INTEL_DESIGN_NAME fdkex
#set INTEL_SDC_FILE 	1
set INTEL_NUM_CPUS     12
set INTEL_SDC_FILE      1
set INTEL_TOPO_DEF      0
set INTEL_INSERT_SCAN 	1
#set INTEL_SPG 	1
# set_scan_configuration -create_dedicated_scan_out_ports true


##INTEL_PVTS
set INTEL_PVTS [dict create {*}{
   psss_0p765v_125c {
     process      psss
     voltage      0p765
     temperature  125
     opcon        typical_1.00
     process_upf  x1r2
     pocv_sigma   1.5
   }
   pfff_0p890v_m40c {
     process      pfff
     voltage      0p890
     temperature  m40
     opcon        typical_1.00
     process_upf  x1r2
     pocv_sigma   3.0
   }
   tttt_0p890v_105c {
     process      tttt
     voltage      0p890
     temperature  105
     opcon        typical_1.00
     process_upf  x1r2
     pocv_sigma   ""
   }
   psss_0p675v_m40c {
     process      psss
     voltage      0p675
     temperature  m40
     opcon        typical_1.00
     process_upf  x1r2
     pocv_sigma   "1.5"
   }
   psss_0p675v_125c {
     process      psss
     voltage      0p675
     temperature  125
     opcon        typical_1.00
     process_upf  x1r2
     pocv_sigma   "1.5"
   }
}]

##Defining a new test mode with apr contraints 
dict_lappend INTEL_MODES "func apr_constraints"   {}


# Defining FUNC_WORST Scenario
dict set INTEL_SCENARIOS FUNC_WORST mode               {func}
dict set INTEL_SCENARIOS FUNC_WORST pvt                {psss_0p675v_125c}
dict set INTEL_SCENARIOS FUNC_WORST rc_interconnect    {pcss}
dict set INTEL_SCENARIOS FUNC_WORST analysis_type      {setup leakage_power dynamic_power max_transition max_capacitance min_capacitance}
dict set INTEL_SCENARIOS FUNC_WORST analysis_type_sta  {max}


# Defining FUNC_BEST Scenario
dict set INTEL_SCENARIOS FUNC_BEST mode                {func}
dict set INTEL_SCENARIOS FUNC_BEST pvt                 {pfff_0p890v_m40c}
dict set INTEL_SCENARIOS FUNC_BEST rc_interconnect     {pcff}
dict set INTEL_SCENARIOS FUNC_BEST analysis_type       {hold leakage_power dynamic_power max_transition max_capacitance min_capacitance}
dict set INTEL_SCENARIOS FUNC_BEST analysis_type_sta   {min power noise}

set INTEL_ALL_VT_TYPES    {base_hp base_lp base_lplvt base_lvt base_nom base_ulp base_ulvt dsseq_hp dsseq_lp dsseq_lplvt dsseq_lvt dsseq_nom dsseq_ulp dsseq_ulvt lvl_hp lvl_lp lvl_lplvt lvl_lvt lvl_nom lvl_ulp lvl_ulvt pwm_hp pwm_lp pwm_lplvt pwm_lvt pwm_nom pwm_ulp pwm_ulvt seq_hp seq_lp seq_lplvt seq_lvt seq_nom seq_ulp seq_ulvt spcl_hp spcl_lp spcl_lplvt spcl_lvt spcl_nom spcl_ulp spcl_ulvt}
set INTEL_ALL_LS_TYPES    {lvl_hp lvl_lp lvl_lplvt lvl_lvt lvl_nom lvl_ulp lvl_ulvt}
set INTEL_ENABLE_VT_TYPES    {base_hp base_lp base_lplvt base_lvt base_nom base_ulp base_ulvt dsseq_hp dsseq_lp dsseq_lplvt dsseq_lvt dsseq_nom dsseq_ulp dsseq_ulvt pwm_hp pwm_lp pwm_lplvt pwm_lvt pwm_nom pwm_ulp pwm_ulvt seq_hp seq_lp seq_lplvt seq_lvt seq_nom seq_ulp seq_ulvt spcl_hp spcl_lp spcl_lplvt spcl_lvt spcl_nom spcl_ulp spcl_ulvt}
set INTEL_ENABLE_LS_TYPES    {lvl_hp lvl_lp lvl_lplvt lvl_lvt lvl_nom lvl_ulp lvl_ulvt}



###APR flow default scenarios 
set INTEL_APR_SCENARIOS {FUNC_WORST FUNC_BEST}



##APR flow steps  Control ###
set INTEL_APR_STEPS {import_design \
  floorplan \
  place \
  post_place \
  cts \
  post_cts \
  route \
  post_route \
  fill }

##sub step control 
set INTEL_APR_SUBSTEPS(fill) { \
  remove_boundary_blockage \
  metal_fill \
  extraction_settings_postfill
  }

##outputs###
set INTEL_OUTPUTS(fill)           " verilog_pg spef sdc def gds oas lteloc abstract fram techlef"


###reports ###
set INTEL_REPORTS(cts)            {lib_files vars flow_vars lib_cell_purpose qor design utilization clocks check_legality check_routability physical}





####user needs to define max paths for STA reporting ###
set INTEL_STA_REPORT_MAX_PATH "100"


### enable it for the exhaustive timing qor report###
set INTEL_PBA_ANALYSIS "1" 
