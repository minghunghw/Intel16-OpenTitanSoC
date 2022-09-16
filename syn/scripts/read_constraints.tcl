## @file
###################################################################
# *NAME* : read_constraints.tcl
#
# *DESCRIPTION* : Reads design SDC/UPF/SAIF constraints
###################################################################

##############################################################################

################
#Read SAIF file
################

if {[info exists INTEL_SAIF] && $INTEL_SAIF==1} {
  if {![info exists INTEL_SAIF_INSTANCE] || $INTEL_SAIF_INSTANCE == ""} {
    set INTEL_SAIF_INSTANCE ${INTEL_DESIGN_NAME}
    puts "==>INFORMATION: setting INTEL_SAIF_INSTANCE to ${INTEL_DESIGN_NAME} since user hasn't set INTEL_SAIF_INSTANCE varible"
  } else {
    puts "==>INFORMATION: INTEL_SAIF_INSTANCE has been set to $INTEL_SAIF_INSTANCE by the user"
  }
  set saif_file ./inputs/constraints/${INTEL_DESIGN_NAME}.saif
  read_saif -auto_map_names -input $saif_file -instance $INTEL_SAIF_INSTANCE -verbose
  puts "==>INFORMATION: read_saif -auto_map_names -input ${INTEL_DESIGN_NAME}.saif -instance $INTEL_SAIF_INSTANCE -verbose"
  redirect ./reports/${INTEL_DESIGN_NAME}.rtl_saif.rpt { report_saif -hier -missing -annotated_flag -type rtl }
}



