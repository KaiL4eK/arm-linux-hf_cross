#!/bin/bash

source ../libs.sh

export AS=/usr/bin/$TARGET-as
export AR=/usr/bin/$TARGET-ar
export CC=/usr/bin/$TARGET-gcc
export CFLAGS="-mcpu=cortex-a7"
export CPP=/usr/bin/$TARGET-cpp
export CXX=/usr/bin/$TARGET-g++
export CXXFLAGS=$CFLAGS
export LD=/usr/bin/$TARGET-ld

rm -rf $BUILD_DIRECTORY &&\
mkdir $BUILD_DIRECTORY &&\
cd $BUILD_DIRECTORY &&\
cmake -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR \
        -D CMAKE_BUILD_TYPE=RELEASE \
        ..
