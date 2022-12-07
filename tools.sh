#!/bin/bash

function usage() {
cat << EOF

Usage: $0 [-h|--help] [-i|--init] [-u|--update] [-c|--commit] [-o|--orfs]

Options:
    -h, --help              Print this help message.

    -i, --init              Initialize all submodules.

    -u, --update            Update all submodules.

    -c, --commit            Commit all changes to submodules.

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
        -c|--commit)
            COMMIT=1
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
    git submodule update --remote --merge --recursive
fi

if [ ! -z "${COMMIT+x}" ]; then
    git add --all :/
    git commit -m "update submodule"
    git push
fi

if [ ! -z "${ORFS+x}" ]; then
    source modules.sh
    # update Yosys and OpenROAD
    cd ip/OpenROAD-flow-scripts
    git clean -x -d --force tools
    git submodule foreach --recursive git clean -x -d --force
    ./build_openroad.sh --local --latest --nice --yosys-args TCL_VERSION=tcl8.5
fi