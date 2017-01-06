#!/bin/bash

unset CC
unset CXX
unset CPP
unset AR
unset AS
unset LD
unset CXXFLAGS
unset CFLAGS
unset LD_LIBRARY_PATH

./configure -prefix ~/qt-arm -release -device linux-rasp-pi-g++ -make libs -device-option CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf- \
		-opensource -confirm-license -platform linux-g++ -xplatform linux-arm-gnueabihf-g++ -nomake examples -nomake tests -optimized-qmake \
		-skip qtwebkit -prefix ~/qt-arm -sysroot $HOME/sysroot
