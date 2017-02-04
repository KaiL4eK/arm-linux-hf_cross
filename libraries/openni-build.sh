#!/bin/bash

. common.sh

REPO_TOOL=git
REPO_ADDRESS=https://github.com/occipital/OpenNI2.git
SRC_DIR=$OPENNI_SRC_DIR

check_src_exist $REPO_TOOL $REPO_ADDRESS $SRC_DIR

export ARM_CXX=$CXX
export ARM_STAGING=$TARGET_SYSROOT

confirm_building &&\
PLATFORM=Arm make -j4 CFG=Debug
