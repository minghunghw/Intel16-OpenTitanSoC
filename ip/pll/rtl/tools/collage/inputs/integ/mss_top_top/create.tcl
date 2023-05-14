proc instantiate_ip {} { 
##Alternate syntax, used for creating duplicate subsystems using variables x and y
##collage_instantiate_component -name <instance>{%x}{%y} -use_hier <template> -noauto

}

proc predefine_hierarchy_ports {} {
    set hier "some_hierarchy"
    eval_in_component [collage_get_ip_hier -ip_name $hier] {
        ## enables creating sets of ports on hierarchy prior to making automatic connections
        ## so you can create ports that are larger than needed by the automatic connections
        set_design_attribute PredefinedInputPorts  {}
        set_design_attribute PredefinedOutputPorts {}
        set_design_attribute PredefinedInoutPorts  {}
    }
}



instantiate_ip
#predefine_hierarchy_ports
