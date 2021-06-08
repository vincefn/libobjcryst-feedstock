#!/bin/bash

cd $SRC_DIR
echo "build_platform: ${build_platform}"

export CPATH="$PREFIX/include:$CPATH"
MYNCPU=$(( (CPU_COUNT > 8) ? 8 : CPU_COUNT ))

# use macos SDK
if [ $build_platform = "osx-64" ]
then
  echo "Download SDK"
  curl -L -O https://github.com/phracker/MacOSX-SDKs/releases/download/10.13/MacOSX10.9.sdk.tar.xz
  tar -vf MacOSX10.9.sdk.tar.xz -c /opt/
  rm MacOSX10.9.sdk.tar.xz
  echo "Use SDK."
  export CXXFLAGS="${CXXFLAGS} -isysroot ${CONDA_BUILD_SYSROOT}"
fi

# apply customizations in sconscript.local
cp ${RECIPE_DIR}/sconscript.local ./

echo "List the directory before build:"
ls .

scons -j $MYNCPU
scons install prefix=$PREFIX

echo "List the directory after build:"
ls .
