#!/bin/bash

cd $SRC_DIR

export CPATH="$PREFIX/include:$CPATH"
MYNCPU=$(( (CPU_COUNT > 8) ? 8 : CPU_COUNT ))

# apply customizations in sconscript.local
cp ${RECIPE_DIR}/sconscript.local ./

echo "List the directory before build:"
ls .

scons -j $MYNCPU

echo "List the directory after build:"
ls .
