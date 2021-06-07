#!/bin/bash

export CPATH="$PREFIX/include:$CPATH"
MYNCPU=$(( (CPU_COUNT > 8) ? 8 : CPU_COUNT ))

# apply customizations in sconscript.local
cp ${RECIPE_DIR}/SConstruct $SRC_DIR/src

echo "Here is the directory before build"
ls $SRC_DIR
echo "Here is what in the src directory before build"
ls $SRC_DIR/src

scons -j $MYNCPU -C $SRC_DIR/src

echo "Here is the directory after build"
ls $SRC_DIR
echo "Here is what in the src directory after build"
ls $SRC_DIR/src
