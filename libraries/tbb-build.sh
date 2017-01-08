#!/bin/bash

source common.sh

REPO_TOOL=git
REPO_ADDRESS=https://github.com/wjakob/tbb.git
SRC_DIR=$TBB_SRC_DIR

check_src_exist $REPO_TOOL $REPO_ADDRESS $SRC_DIR &&\
$REPO_TOOL checkout master &&\
rm -rf $BUILD_DIRECTORY &&\
mkdir $BUILD_DIRECTORY &&\
cd $BUILD_DIRECTORY &&\
cmake -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_TOOLCHAIN_FILE=$CMAKE_TOOLCHAIN .. &&\
confirm_building &&\
make install -j4

# For TBB with Makefile
#ARCH=armv7
#COMPILER=$TARGET-gcc
#make arch=$ARCH compiler=$COMPILER -j4 &&\
#rsync -a build/linux_"$ARCH"_"$COMPILER"_cc4.8_libc2.19_kernel3.19.0_release/*.so* lib
