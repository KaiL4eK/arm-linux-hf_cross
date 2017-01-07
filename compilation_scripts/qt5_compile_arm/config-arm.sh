#!/bin/bash

source ../libs.sh

unset CC
unset CXX
unset CPP
unset AR
unset AS
unset LD
unset CXXFLAGS
unset CFLAGS

./configure -prefix ~/qt-arm -release \
		-device linux-rasp-pi-g++ -make libs -device-option CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf- \
		-opensource -confirm-license \
		-platform linux-g++ -xplatform linux-arm-gnueabihf-g++ \
		-nomake examples -nomake tests -optimized-qmake \
		-skip qtwebkit \
		-reduce-exports \
		-opengl es2 \
		-prefix $QT_INSTALL_DIR \
		-extprefix $QT_INSTALL_DIR \
		-qt-xcb \
		-sysroot $SYSROOT -v

