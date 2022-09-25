# Run synthesis

There are three types of standard cells in the library. Default we choose `b15_7t_108pp`. If you want to use the other one, you need to change or override the variables `INTEL_STDCELLS` and `STD_TCL_DIR` in Makefile.

`rtl_targets.tcl` specify all the relative path for the design compiler. 

For running the dc flow for a certain block, run
```
make DESIGN_NAME=<some_design>
```

After the synthesis is completed, copy the netlist for `post_syn` and `post_syn_unit`.
```
make netlist
```