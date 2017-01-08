#!/bin/bash

source ../libs.sh

rm -rf $BUILD_DIRECTORY &&\
mkdir $BUILD_DIRECTORY &&\
cd $BUILD_DIRECTORY &&\
cmake -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR \
        -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_TOOLCHAIN_FILE=$CMAKE_TOOLCHAIN \
        ..

# For TBB with Makefile
#ARCH=armv7
#COMPILER=$TARGET-gcc
#make arch=$ARCH compiler=$COMPILER -j4 &&\
#rsync -a build/linux_"$ARCH"_"$COMPILER"_cc4.8_libc2.19_kernel3.19.0_release/*.so* lib
