#!/bin/bash

source common.sh

REPO_TOOL=git
REPO_ADDRESS=https://github.com/01org/tbb.git
SRC_DIR=$TBB_ALT_SRC_DIR

check_src_exist $REPO_TOOL $REPO_ADDRESS $SRC_DIR &&\
#$REPO_TOOL checkout master
# For TBB with Makefile
COMPILER_INC="build/linux.$TARGET-gcc.inc"
if [ ! -f "COMPILER_INC" ]; then
        cp "build/linux.gcc.inc" $COMPILER_INC
        sed -i "s/CPLUS = g++/CPLUS = $TARGET-g++/g" $COMPILER_INC
        sed -i "s/CONLY = gcc/CONLY = $TARGET-gcc/g" $COMPILER_INC
	sed -i "/C_FLAGS = $(CPLUS_FLAGS)/a C_FLAGS += --sysroot=$SYSROOT" $COMPILER_INC
fi

ARCH=armv7
COMPILER=$TARGET-gcc
make arch=$ARCH compiler=$COMPILER -j4 &&\
rsync -a build/linux_"$ARCH"_"$COMPILER"_cc4.8_libc2.19_kernel3.19.0_release/*.so* $LIBRARY_DIR
rsync -a include/tbb $INCLUDE_DIR
