
set G_DESIGN_NAME mss_top_top
#set G_LIBRRY_TYPE [exec ToolConfig.pl get_tool_var ctech ctech_stdlib_type]
set G_LIBRRY_TYPE d04
set G_UPF 1
set G_INSERT_SCAN 0
#set G_INSERT_SCAN 1 ## need to populate <name of IP>_scan_config.tcl first

#set G_STDCELL_DIR [exec ToolConfig.pl get_tool_path cell_library]
set G_STDCELL_DIR /p/hdk/cad/stdcells/d04/16ww06.5_d04_i.0.p3_chvbxtmiggt
#set G_LIBERTY_LIBS "/p/hdk/abcd/xyz/pqrs/"

#set FT_MAPPING_INCL_FILES "  /p/coeenv/proj_tools/projabcd/pqr/include/proj_tcl/da_flow_procs.stcl /p/coeenv/proj_tools/projabcd/xyz/1273.1/include/proj_tcl/da_get_procs.stcl $env(WARD)/collateral/fishtail/my_clocks.tcl "

#set FT_PROJ_CFG_FILE /remote/disk/abcd/my_proj_files/proj_scripts/my_proj_ft_config_file.cfg

set G_SKIP [list insert_dft]
#set G_SCAN_REPLACE_FLOPS 0
