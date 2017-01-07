#!/bin/bash

libraries_directory=$HOME

TBB_ROOT=$libraries_directory/tbb-src
TBB_INSTALL_DIR=$libraries_directory/tbb-arm
TBB_INCLUDE_DIR=$TBB_INSTALL_DIR/include
TBB_LIB_DIR=$TBB_INSTALL_DIR/lib
TBB_STDDEF_PATH=$TBB_INSTALL_DIR/include/tbb/tbb_stddef.h

OPENCV_INSTALL_DIR=$libraries_directory/opencv-arm
OPENCV_SRC_ROOT=$libraries_directory/opencv-3.1.0

SYSROOT=$HOME/sysroot

QT_INSTALL_DIR=$HOME/qt-arm

EIGEN_INSTALL_DIR=$HOME/eigen-arm
EIGEN_INCLUDE_DIR=$EIGEN_INSTALL_DIR/include/eigen3

BUILD_DIRECTORY=build_user_cmake

#PYTHONPATH=$OPENCV_DIR/lib/python2.7/dist-packages:$PYTHONPATH

PKG_CONFIG_PATH=$OPENCV_INSTALL_DIR/lib/pkgconfig:$EIGEN_INSTALL_DIR/include/pkgconfig:$PKG_CONFIG_PATH

