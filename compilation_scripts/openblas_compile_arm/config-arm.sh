#!/bin/bash

source ../libs.sh

# required for linkage
# sudo ln -sf $TARGET_SYSROOT/usr/lib/$TARGET/libpthread.so /lib/libpthread.so.0
# sudo ln -sf $TARGET_SYSROOT/usr/lib/$TARGET/libpthread_nonshared.a /usr/lib/libpthread_nonshared.a

make -j4 HOSTCC=gcc FC="" TARGET=ARMV7 && \
make install PREFIX=$INSTALL_DIR
