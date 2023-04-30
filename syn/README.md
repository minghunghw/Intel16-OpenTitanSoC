### Run synthesis
-----------------------------------------------------------

There are three types of standard cells in the library. Default we choose `b0m_6t_108pp`. If you want to use the other one, you need to change or override the variables `INTEL_STDCELLS` and `STD_TCL_DIR` in Makefile.

For running the dc flow for a certain block, run
```
make DESIGN_NAME=<some_design>
```

After the synthesis is completed, it will copy the netlist for `post_syn` and `post_syn_unit`.

### How to add customized design
-----------------------------------------------------------

- `rtl_targets.tcl` specify all the relative path for the design compiler.
- Create a folder with your design name at least with the following structure.
```
├── inputs
│   ├── constraints
│   |   ├── <design_name>.clocks.tcl
|   |   └── <design_name>.constraints.tcl
│   └── rtl
|       └── <design_name>.rtl_list.tcl
└── scripts
    └── block_setup.tcl
```
- `clock`: clock constraints
- `constraints`: design constraints
- `rtl_list`: RTL inputs
- `block_setup`: override block level settings