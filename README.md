# Intel16-OpenTitanSoC

Major directories are listed below, the diagram is generated with `tree`:

- `sim` : RTL simulations and related scripts
- `hw`  : RTL sources
- `sw`  : software sources
- `syn` : build directory for synthesis
- `apr` : build directory for place & route
```
├── sim
│   ├── pre_syn_unit
│   ├── pre_syn
│   ├── post_syn
│   ├── post_apr
│   └── test_data
├── src_hw
│   ├── tb
│   └── v
├── src_sw
│   ├── common
│   ├── hex
│   ├── src_asm
│   └── src_c
├── syn
└── apr
```

# Setup

### Clone repository and submodules
-----------------------------------------------------------

Clone the repo and init all submodules
```
git clone git@github.com:minghungumich/Intel16-OpenTitanSoC.git
cd Intel16-OpenTitanSoC
./gitmodules_init.sh
```

### Initialize vlsipool environment (K machine only)
-----------------------------------------------------------

Source `modules.sh` before doing any development or tool work. This will clear any other preloaded modules, so be sure to source other overriding module scripts after that. Remember to validate `eecstokens` before proceeding.
```
source modules.sh
```

# Running simulations

(Not available yet)
```
cd sim/pre-syn
make
```
