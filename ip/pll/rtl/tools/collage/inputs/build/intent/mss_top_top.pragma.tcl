# Intent file for mss_top_top
#   Added during the LoadDesigns activity, as if special reuse-pragma comments 
#   had been inserted into the source code for that activity.
# See <model_root>/tools/collage/inputs/build/intent/EXAMPLE.pragma.tcl for more information about common commands

add_files_to_filegroup RTL -files $::collage_ip_info::input_files_processed -install ip-collateral/src/rtl
set_filegroup_attribute RTL Label "RTL For mss_top_top"
set_filegroup_attribute RTL Configurable 1
set_filegroup_attribute RTL ConfigActivity "ConfigureRtlFormss_top_top"

set variation [create_configuration_parameter -type string -group RTL IP_VARIATION] 
set_configuration_parameter_attribute $variation EnumValues {common cfg0 cfg1 cfg2}
set_configuration_parameter_attribute $variation DefaultValue "common";
set_configuration_parameter_attribute $variation Label "IP Configuration Variation"
set_configuration_parameter_attribute $variation Description "Enables selecting from preconfigured configuration contours."

