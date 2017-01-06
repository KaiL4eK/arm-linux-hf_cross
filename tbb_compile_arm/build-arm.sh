#!/bin/bash

if [ -z $1 ]; then
	echo "Option is not set"
else
	case $1 in
	
	"compile" )
	make arch=armv7 compiler=arm-linux-gnueabihf-gcc -j4
	mkdir lib
	mv build/linux_armv7_arm-linux-gnueabihf-gcc_cc4.8_libc2.19_kernel3.19.0_release/*.so* lib
	;;

	"clean" )
	make arch=armv7 compiler=arm-linux-gnueabihf-gcc clean
	rm -rf lib
	;;

	esac
fi

