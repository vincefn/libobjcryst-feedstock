#!/bin/bash

export CPATH="$PREFIX/include:$CPATH"
MYNCPU=$(( (CPU_COUNT > 8) ? 8 : CPU_COUNT ))

# apply customizations in sconscript.local
cp ${RECIPE_DIR}/sconscript.local ./

scons -j $MYNCPU
scons install prefix=$PREFIX
