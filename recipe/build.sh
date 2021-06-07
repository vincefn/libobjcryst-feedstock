#!/bin/bash

export CPATH="$PREFIX/include:$CPATH"
MYNCPU=$(( (CPU_COUNT > 8) ? 8 : CPU_COUNT ))

# apply customizations in sconscript.local
cp ${RECIPE_DIR}/SConstruct ./

echo "Here is the directory before build"
tree .

scons -j $MYNCPU

echo "Here is the directory after build"
