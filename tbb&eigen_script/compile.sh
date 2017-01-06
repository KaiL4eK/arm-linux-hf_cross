#!/bin/bash

libraries_directory=$(pwd)

EIGEN_ROOT=$libraries_directory/eigen-eigen-26667be4f70b
EIGEN_INSTALL_DIR=$libraries_directory/eigen-arm
EIGEN_INCLUDE_PATH=$EIGEN_INSTALL_DIR/include/eigen3

cd $EIGEN_ROOT &&\
rm -rf build &&\
mkdir build &&\
cd build &&\ 
cmake -D CMAKE_INSTALL_PREFIX=$EIGEN_INSTALL_DIR .. &&\
make install -j4

TBB_ROOT=$libraries_directory/tbb2017_20161128oss
TBB_INCLUDE_DIR=$TBB_ROOT/include
TBB_LIB_DIR=$TBB_ROOT/lib
TBB_STDDEF_PATH=$TBB_ROOT/include/tbb/tbb_stddef.h

ARCH=armv7
COMPILER=$TARGET-gcc
cd $TBB_ROOT &&\
make arch=$ARCH compiler=$COMPILER -j4 &&\
mkdir -p lib &&\
rsync -a build/linux_"$ARCH"_"$COMPILER"_cc4.8_libc2.19_kernel3.19.0_release/*.so* lib

OPENCV_INSTALL_DIR=$libraries_directory/opencv-arm

#PYTHONPATH=$OPENCV_DIR/lib/python2.7/dist-packages:$PYTHONPATH
#PKG_CONFIG_PATH=$OPENCV_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

OPENCV_SRC_ROOT=$libraries_directory/opencv-3.1.0


