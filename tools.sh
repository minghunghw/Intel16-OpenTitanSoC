#!/bin/bash

function usage() {
cat << EOF

Usage: $0 [-h|--help] [-i|--init] [-u|--update] [-r|--recursive] [-o|--orfs]

Options:
    -h, --help              Print this help message.

    -i, --init              Initialize all submodules.

    -u, --update            Update all submodules.

    -r, --recursive         Update all submodules recursively.

    -o, --orfs              Update Yosys and OpenROAD.
EOF
}

while (( "$#" )); do
    case "$1" in
        -h|--help)
            usage
            exit
            ;;
        -i|--init)
            INIT=1
            ;;
        -u|--update)
            UPDATE=1
            ;;
        -r|--recursive)
            RECURSIVE=1
            ;;
        -o|--orfs)
            ORFS=1
            ;;
        -*|--*) # unsupported flags
            echo "[ERROR] Unsupported flag $1."
            usage
            exit
            ;;
    esac
    shift
done

if [ ! -z "${INIT+x}" ]; then
    # init all submodules
    git submodule update --init --recursive
fi

if [ ! -z "${UPDATE+x}" ]; then
    # update all submodules
    git submodule update --remote --merge
fi

if [ ! -z "${RECURSIVE+x}" ]; then
    # update all submodules recursively
    git submodule update --remote --merge --recursive
fi

if [ ! -z "${ORFS+x}" ]; then
    source modules.sh
    # update Yosys and OpenROAD
    cd ip/OpenROAD-flow-scripts
    rm -rf tools/yosys/abc
    ./build_openroad.sh --clean-force --no_init --local --latest --nice --yosys-args TCL_VERSION=tcl8.5
fi