#!/bin/bash

cd $SRC_DIR
echo "build_platform: ${build_platform}"

export CPATH="$PREFIX/include:$CPATH"
MYNCPU=$(( (CPU_COUNT > 8) ? 8 : CPU_COUNT ))

# use macos SDK
if [ $build_platform = "osx-64" ]
then
  echo "Use conda compiler."
  export CFLAGS="${CFLAGS} -i sysroot ${CONDA_BUILD_SYSROOT}"
  export CPPFLAGS="${CPPFLAGS} -i sysroot ${CONDA_BUILD_SYSROOT}"
  export CXXFLAGS="${CXXFLAGS} -i sysroot ${CONDA_BUILD_SYSROOT}"
fi

# apply customizations in sconscript.local
cp ${RECIPE_DIR}/sconscript.local ./

echo "List the directory before build:"
ls .

scons -j $MYNCPU --diskcheck=none
scons install prefix=$PREFIX

echo "List the directory after build:"
ls .
