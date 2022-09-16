## @file
###################################################################
# *NAME* : lef2fram.tcl
#
# *DESCRIPTION* : Standalone script to create MW FRAM view from LEF
###################################################################

##############################################################################
# Standalone script: Create MW FRAM view from LEF. 
#
# Variables to set:
#   TECH_FILE : Full path to ICC tech file
#   LAYER_MAP:  Full path to GDS to Milkyway layer map
#   MACRO: Macro_name. Env variable. setenv MACRO <ipname> prior to running this script.
#   Techfile/Layermap associatations for the script need to be set once in the golden script
#   No more modifications are needed beyond that to run this script.
#
# Input: 
#	LEF file: lef/$MACRO.lef
# Output:
#	MWDB: fram/$MACRO
# RUN Folder: 
#	Folder containing lef/$MACRO.lef
# Run: 
#	Milkyway -tcl -file scripts/lef2fram.tcl -nullDisplay
###############################################################################

# Flag to error out on failure
suppress_message SEL-004
set flag [catch {

# Tech file associations (Modify <path_to> to local path)
  set TECH_FILE <path_to_>/p1222_icc2.tf
  set LAYER_MAP <path_to>/1222Gds2MilkywayLayerMap

  # Set Macro name & Type 
  set MACRO_NAME $env(MACRO)
  set MACRO_TYPE "macro"

  # Creating directory for FRAM creation and cleanup
  set LEF_FILE [sh /bin/ls lef/${MACRO_NAME}.lef]
  set LIB_NAME fram/${MACRO_NAME}
  sh /bin/mkdir fram -p
  sh /bin/rm $LIB_NAME -rf

  extend_mw_layers
  # Create Milkyway Library using Techfile"
  cmCreateLib
  setFormField create_library library_name $LIB_NAME
  setFormField create_library technology_file_name $TECH_FILE
  setFormField create_library set_case_sensitive 1
  formOK create_library

  #Set bus naming style
  cmSetBusNameStyle
  setFormField set_bus_naming_style bus_naming_style {[%d]}
  setFormField set_bus_naming_style library_name $LIB_NAME
  formOK set_bus_naming_style

  # Read in LEF
  read_lef -lib_name $LIB_NAME \
    -cell_lef_files $LEF_FILE \
    -advanced_lib_prep_mode \
    -layer_mapping $LAYER_MAP \
    -cell_version overwrite \
    -cell_boundary by_overlap_layer

    # Open Library
  open_mw_lib $LIB_NAME

  # Mark Cell Type for the Macro
  cmMarkCellType
  setFormField mark_cell_type library_name $LIB_NAME
  setFormField mark_cell_type cell_name $MACRO_NAME.FRAM
  setFormField mark_cell_type cell_type $MACRO_TYPE
  formOK mark_cell_type

  cmMarkCellType
  setFormField mark_cell_type library_name $LIB_NAME
  setFormField mark_cell_type cell_name $MACRO_NAME
  setFormField mark_cell_type cell_type $MACRO_TYPE
  formOK mark_cell_type

  auExtractBlockagePinVia
  setFormField extract_blockage library_name $LIB_NAME
  setFormField extract_blockage cell_name $MACRO_NAME
  formButton extract_blockage extractBlkg
  setFormField extract_blockage routing_blockage_output_layer metBlk
  setFormField extract_blockage extract_via_region_up_to_metal 11
  setFormField extract_blockage treat_all_blockage_as_thin_wire 1
  formOK extract_blockage

  # Converting Via Blockages into Via Layers
  open_mw_cel $MACRO_NAME.FRAM
  # via3
  if {[get_routing_blockages -filter {layer==via3Blockage}]!=""} {
    foreach_in_collection v [get_routing_blockages -filter {layer==via3Blockage}] {
      set _llx [get_attribute $v bbox_llx]
      set _lly [get_attribute $v bbox_lly]
      set _urx [get_attribute $v bbox_urx]
      set _ury [get_attribute $v bbox_ury]
      create_user_shape -layer v3 -bbox [list $_llx $_lly $_urx $_ury]
    }
    remove_routing_blockage [get_routing_blockages -filter {layer==via3Blockage}]
    set v ""
  }

  #via4
  if {[get_routing_blockages -filter {layer==via4Blockage}]!=""} {
    foreach_in_collection v [get_routing_blockages -filter {layer==via4Blockage}] {
      set _llx [get_attribute $v bbox_llx]
      set _lly [get_attribute $v bbox_lly]
      set _urx [get_attribute $v bbox_urx]
      set _ury [get_attribute $v bbox_ury]
      create_user_shape -layer v4 -bbox [list $_llx $_lly $_urx $_ury]
    }
    remove_routing_blockage [get_routing_blockages -filter {layer==via4Blockage}]
    set v ""
  }

  #via5
  if {[get_routing_blockages -filter {layer==via5Blockage}]!=""} {
    foreach_in_collection v [get_routing_blockages -filter {layer==via5Blockage}] {
      set _llx [get_attribute $v bbox_llx]
      set _lly [get_attribute $v bbox_lly]
      set _urx [get_attribute $v bbox_urx]
      set _ury [get_attribute $v bbox_ury]
      create_user_shape -layer v5 -bbox [list $_llx $_lly $_urx $_ury]
    }
    remove_routing_blockage [get_routing_blockages -filter {layer==via5Blockage}]
    set v ""
  }

  #via6
  if {[get_routing_blockages -filter {layer==via6Blockage}]!=""} {
    foreach_in_collection v [get_routing_blockages -filter {layer==via6Blockage}] {
      set _llx [get_attribute $v bbox_llx]
      set _lly [get_attribute $v bbox_lly]
      set _urx [get_attribute $v bbox_urx]
      set _ury [get_attribute $v bbox_ury]
      create_user_shape -layer v6 -bbox [list $_llx $_lly $_urx $_ury]
    }
    remove_routing_blockage [get_routing_blockages -filter {layer==via6Blockage}]
    set v ""
  }

  save_mw_cel
  close_mw_cel

  # Close Library
  geCloseLib
}]
if { $flag != 0 } {
  echo "Error: There was an error during lef2fram conversion for $MACRO_NAME"
  exit 1
} else {
  echo "Success: lef2fram conversion successful for $MACRO_NAME"
}
exit 0

