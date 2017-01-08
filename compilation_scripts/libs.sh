#!/bin/bash

if [ -z $TARGET ]; then
	echo "Target is not set. It can happen if started outside Docker container"
	exit 1
fi

SYSROOT=$TARGET_SYSROOT
CMAKE_TOOLCHAIN=$TARGET_CMAKE_TOOLCHAIN

INSTALL_DIR=$HOME/$TARGET-compiled_data
INCLUDE_DIR=$INSTALL_DIR/include
LIBRARY_DIR=$INSTALL_DIR/lib

QT_HOST_INSTALL_DIR=$HOME/qt-host

#TBB_STDDEF_PATH=$INCLUDE_DIR/tbb/tbb_stddef.h

EIGEN_INCLUDE_DIR=$INCLUDE_DIR/eigen3

BUILD_DIRECTORY=build_user_cmake

#PYTHONPATH=$OPENCV_DIR/lib/python2.7/dist-packages:$PYTHONPATH

PKG_CONFIG_PATH=$INSTALL_DIR/lib/pkgconfig:$INSTALL_DIR/include/pkgconfig:$PKG_CONFIG_PATH

CMAKE_LIB_DIR="$INSTALL_DIR/share;$INSTALL_DIR/lib/cmake"
