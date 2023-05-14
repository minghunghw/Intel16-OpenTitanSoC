# Intent file Sytax
#   Added during the LoadDesigns activity, as if special reuse-pragma comments 
#   had been inserted into the source code for that activity.
# Example: add_files_to_filegroup <name> -files {<list of files>} -install <install_directory> 
#     Creates the filegroup <name> if it does not already exist.
# Example: add_hdl_pragma -attr <name> -value <value> <options> <object selector>
# Example options: -ignore <object selector>         -- this tells collage to ignore the given object
# Example options: -ignore <line_selector>           -- this tells collage to ignore the line(s) specified. 
#     If possible, the object version of the ignore command should be used. If the files are edited, 
#     line numbers may change, but objects can still be located.
# Example options: -process_ifdef [all_branches|standard] 
#     This command tells coreBuilder to change `ifdef processing mode. The default processing mode at the
#     start of every file is all_branches. The processing mode only applies to `ifdef statements that refer to
#     parameter macros. Note that this form only supports the option -line, since this pragma is never paired.
# Example options: -macro <select_the_macro>         -- this refers to a macro definition (in Verilog)
#     It specifies to collage that this macro definition should become a configuration parameter
# Example options: -library <library_name>           -- Override the current library (in VHDL)
# Example options: -design <select_the_design>       -- generally combined with another option to select object within this design
# Example options: -package <select_the_package>     -- generally combined with another option to select an object within a package
# Example options: -function <select_the_function>   -- refers to a function in the design or package
# Example options: -parameter <select_the_parameter> -- refers to a parameter in the design or package
# Example options: -type <select_the_type>           -- refers to a type or subtype in the design or package
# Example options: -port <select_the_port>           -- refers to a port in the design
# Example options: -cell <select_the_cell>           -- refers to a cell in the design
# Example options: -signal <select_the_signal>       -- refers to a signal or wire in the design
# Example options: -file <select_the_file>               -- Allows the user to select a file (default is HDK file associated with this intent file)
# Example options: -line <select_specified_line>         -- A line number in the file
# Example options: -start_line <select_a_range_of_lines> -- A range of lines in the file (starting point)
# Example options: -end_line <end_of_range_of_lines>     -- A range of lines in the file (ending point)
