#!/bin/bash

source common.sh

REPO_TOOL=hg
REPO_ADDRESS=https://bitbucket.org/eigen/eigen/
SRC_DIR=$EIGEN_SRC_DIR

check_src_exist $REPO_TOOL $REPO_ADDRESS $SRC_DIR &&\
$REPO_TOOL checkout 3.3.1 &&\
rm -rf $BUILD_DIRECTORY &&\
mkdir $BUILD_DIRECTORY &&\
cd $BUILD_DIRECTORY &&\
cmake -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR -D CMAKE_BUILD_TYPE=RELEASE .. &&\
confirm_building &&\
make install -j4
