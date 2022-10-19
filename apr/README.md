### Tool setup
-----------------------------------------------------------

You need to build the [OpenROAD-flow-scripts](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts) before running APR.

Go to `ip/OpenROAD-flow-scripts` first. Remember to source `modules.sh` before proceeding.
```
cd ../ip/OpenROAD-flow-scripts
```

\
Then modify `__local_build()` part in `build_openroad.sh`

- In Yosys, add `TCL_VERSION=tcl8.5` at the end of the line like 
```
${NICE} make install -C tools/yosys -j "${PROC}" ${YOSYS_ARGS} TCL_VERSION=tcl8.5
``` 

\
Now you can build all the tools.
```
./build_openroad.sh --local --latest --nice
```

\
Make sure to add the tool into path after installation.
```
source setup_env.sh
```  

\
If you want to make sure you install successfully, run the design flow.
```
cd flow
make
```