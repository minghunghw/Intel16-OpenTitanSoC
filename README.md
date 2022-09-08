# Intel16-OpenTitanSoC
-----------------------------------------------------------

Major directories are listed below, the diagram is generated with `tree`:

- `sim` : RTL simulations and related scripts
- `hw`  : RTL sources
- `sw`  : software sources
- `syn` : build directory for synthesis
- `apr` : build directory for place & route
```
├── sim
│   ├── pre-syn-unit
│   ├── pre-syn
│   ├── post-syn
│   └── post-apr
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

