### Tool setup
-----------------------------------------------------------

You need to build the [OpenROAD-flow-scripts](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts) before running APR.

To build the ORFS tool, run on top of the repository
```
./tools.sh --orfs
```

### Tool update
-----------------------------------------------------------

If you want to update the version of OpenROAD and Yosys, run on top of the repository
```
./tools.sh --update --orfs
```

### How to add customized design
-----------------------------------------------------------

- Add the design config into `Makefile`.
- Create a folder with your design name at least with the following structure.
```
└── designs
    └── intel16
    |   └── <design_name>
    |       ├── config.mk
    |       └── constraint.sdc   
    └── src
        └── <design_name>
```
- `config.mk`: design configuration
- `constraint.sdc`: design constraints

### How to run DRC/LVS
-----------------------------------------------------------

Intel provides DRC/LVS runsets for Calibre and IC-Validator.

- Calibre provides drc, antenna, density, hveos, and lvs check. If you want to run them all together, type 
```
make calibre
```
If you just want run one of them, type
```
make calibre_<drc/antenna/density/hveos/lvs>
```

- ICV provides drc, antenna, density, layer, iopad, template, and lvs check. If you want to run them all together, type 
```
make icv
```
If you just want run one of them, type
```
make icv_<drc/antenna/density/layer/iopad/template/lvs>
```