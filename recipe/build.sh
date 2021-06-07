#!/bin/bash

cd $SRC_DIR

export CPATH="$PREFIX/include:$CPATH"
MYNCPU=$(( (CPU_COUNT > 8) ? 8 : CPU_COUNT ))

# apply customizations in sconscript.local
cp ${RECIPE_DIR}/SConscript.local ./

echo "Here is the directory before build"
ls .
echo "Here is what in the src directory before build"
ls ./src

scons -j $MYNCPU

echo "Here is the directory after build"
ls .
echo "Here is what in the src directory after build"
ls ./src
