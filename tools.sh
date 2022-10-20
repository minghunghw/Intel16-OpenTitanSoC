#!/bin/bash

if [ $1 == "init" ]; then
    # init all submodules
    git submodule update --init --recursive
elif [ $1 == "update" ]; then
    # update all submodules
    git submodule update --remote --merge --recursive
    git add --all :/
    git commit -m "update submodule"
    git push
elif [ $1 == "orfs" ]; then
    source modules.sh
    # update Yosys and OpenROAD
    cd ip/OpenROAD-flow-scripts
    git clean -x -d --force tools
    git submodule foreach --recursive git clean -x -d --force
    ./build_openroad.sh --local --latest --nice
else
    echo "Usage: ./tools.sh [init|update|orfs]"
fi
