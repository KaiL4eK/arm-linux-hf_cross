#!/bin/bash

source libs.sh

BUILD_DIRECTORY=build_user_cmake

# https://KaiL4eK@bitbucket.org/eigen/eigen

cd $EIGEN_ROOT &&\
rm -rf BUILD_DIRECTORY &&\
mkdir BUILD_DIRECTORY &&\
cd BUILD_DIRECTORY &&\
cmake -D CMAKE_INSTALL_PREFIX=$EIGEN_INSTALL_DIR \
	-D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_TOOLCHAIN_FILE=$HOME/rpi-toolchain.cmake \
	.. &&\
make install -j4

# https://github.com/wjakob/tbb.git

cd $TBB_ROOT &&\
rm -rf BUILD_DIRECTORY &&\
mkdir BUILD_DIRECTORY &&\
cd BUILD_DIRECTORY &&\
cmake -D CMAKE_INSTALL_PREFIX=$TBB_INSTALL_DIR \
        -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_TOOLCHAIN_FILE=$HOME/rpi-toolchain.cmake \
        .. &&\
make install -j4





#ARCH=armv7
#COMPILER=$TARGET-gcc
#cd $TBB_ROOT &&\
#make arch=$ARCH compiler=$COMPILER -j4 &&\
#mkdir -p lib &&\
#rsync -a build/linux_"$ARCH"_"$COMPILER"_cc4.8_libc2.19_kernel3.19.0_release/*.so* lib
