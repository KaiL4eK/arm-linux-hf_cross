#!/bin/bash

if [ -z $TARGET ]; then
	echo "Target is not set. It can happen if started outside Docker container"
	exit 1
fi

# parameters: tool, repo_address, src_directory
function check_src_exist {
	if [ ! -d "$3" ]; then
        	echo "Downloading sources from $2 to $3"
        	$1 clone $2 $3
	fi
	cd $3
}

function confirm_building () {
    # call with a prompt string or use a default
    read -r -p "Are you sure to build? [y/N]" response
    case $response in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

TBB_SRC_DIR=tbb-src
TBB_ALT_SRC_DIR=tbb-alt-src
EIGEN_SRC_DIR=eigen-src
OPENCV_SRC_DIR=opencv-src
OPENBLAS_SRC_DIR=openblas-src
QT5_SRC_DIR=qt5-src
OPENNI_SRC_DIR=openni-src

SYSROOT=$TARGET_SYSROOT
CMAKE_TOOLCHAIN=$TARGET_CMAKE_TOOLCHAIN
BUILD_DIRECTORY=build_$TARGET

INSTALL_DIR=$(pwd)/"$TARGET"_data
INCLUDE_DIR=$INSTALL_DIR/include
LIBRARY_DIR=$INSTALL_DIR/lib

QT_HOST_INSTALL_DIR=$(pwd)/qt-"$HOST"-data

#PYTHONPATH=$OPENCV_DIR/lib/python2.7/dist-packages:$PYTHONPATH

PKG_CONFIG_PATH=$INSTALL_DIR/lib/pkgconfig:$INSTALL_DIR/include/pkgconfig:$PKG_CONFIG_PATH

CMAKE_LIB_DIR="$INSTALL_DIR/share;$INSTALL_DIR/lib/cmake"
