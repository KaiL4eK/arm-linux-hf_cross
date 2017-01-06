#!/bin/bash

libraries_directory=$(pwd)/../

EIGEN_INSTALL_DIR=$libraries_directory/eigen-arm
EIGEN_INCLUDE_PATH=$EIGEN_INSTALL_DIR/include/eigen3

TBB_ROOT=$libraries_directory/tbb2017_20161128oss
TBB_INCLUDE_DIR=$TBB_ROOT/include
TBB_LIB_DIR=$TBB_ROOT/lib

OPENCV_INSTALL_DIR=$libraries_directory/opencv-arm
OPENCV_SRC_ROOT=$libraries_directory/opencv-3.1.0

mkdir build
cd build
cmake -D WITH_TBB=ON -D TBB_INCLUDE_DIRS=$TBB_INCLUDE_DIR -D TBB_LIB_DIR=$TBB_LIB_DIR -D WITH_EIGEN=ON \
        -D EIGEN_INCLUDE_PATH=$EIGEN_INCLUDE_PATH -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=$OPENCV_INSTALL_DIR \
        -D INSTALL_PYTHON_EXAMPLES=ON -D WITH_IPP=ON -D CMAKE_SYSROOT=$HOME/sysroot ..
