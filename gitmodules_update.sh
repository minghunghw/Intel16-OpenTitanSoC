#!/bin/bash

# update all submodules
git submodule update --remote --merge --recursive

# update Yosys and OpenROAD
cd ip/OpenROAD-flow-scripts
git clean -x -d --force tools
git submodule foreach --recursive git clean -x -d --force
./build_openroad.sh --local --latest --nice