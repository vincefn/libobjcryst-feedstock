#!/bin/bash

cd $SRC_DIR

export CPATH="$PREFIX/include:$CPATH"
MYNCPU=$(( (CPU_COUNT > 8) ? 8 : CPU_COUNT ))

# point to the correct compilers
export CFLAGS="${CFLAGS} -i sysroot ${CONDA_BUILD_SYSROOT}"
export CPPFLAGS="${CPPFLAGS} -i sysroot ${CONDA_BUILD_SYSROOT}"
export CXXFLAGS="${CXXFLAGS} -i sysroot ${CONDA_BUILD_SYSROOT}"
export LDFLAGS="${LDFLAGS} -i sysroot ${CONDA_BUILD_SYSROOT}"

# apply customizations in sconscript.local
cp ${RECIPE_DIR}/sconscript.local ./

echo "List the directory before build:"
ls .

scons -j $MYNCPU
scons install prefix=$PREFIX

echo "List the directory after build:"
ls .
