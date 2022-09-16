## @file
###################################################################
# *NAME* : lef2ndm.tcl
#
# *DESCRIPTION* : Standalone script to create NDM view from LEF
###################################################################

# This script will ndms from lef 
create_workspace ${name} -flow frame -tech $INTEL_TECH_FILE
read_lef outputs/${name}.lef
check_workspace
commit_workspace -output ndm/$name.abstract.ndm
remove_workspace
exit

