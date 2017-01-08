#!/bin/bash

if [ -z $TARGET ]; then
	echo "Target is not set. It can happen if started outside Docker container"
	exit 1
fi

SYSROOT=$TARGET_SYSROOT
CMAKE_TOOLCHAIN=$TARGET_CMAKE_TOOLCHAIN
BUILD_DIRECTORY=build_$TARGET

INSTALL_DIR=$HOME/$TARGET-data
INCLUDE_DIR=$INSTALL_DIR/include
LIBRARY_DIR=$INSTALL_DIR/lib

QT_HOST_INSTALL_DIR=$HOME/qt-host-data

#PYTHONPATH=$OPENCV_DIR/lib/python2.7/dist-packages:$PYTHONPATH

PKG_CONFIG_PATH=$INSTALL_DIR/lib/pkgconfig:$INSTALL_DIR/include/pkgconfig:$PKG_CONFIG_PATH

CMAKE_LIB_DIR="$INSTALL_DIR/share;$INSTALL_DIR/lib/cmake"
