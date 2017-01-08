#!/bin/bash

source common.sh

REPO_TOOL=git
REPO_ADDRESS=https://github.com/xianyi/OpenBLAS
SRC_DIR=$OPENBLAS_SRC_DIR

check_src_exist $REPO_TOOL $REPO_ADDRESS $SRC_DIR &&\
$REPO_TOOL checkout master &&\
confirm_building &&\
make -j4 HOSTCC=gcc FC="" TARGET=ARMV7 && \
make install PREFIX=$INSTALL_DIR
