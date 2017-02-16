# arm-linux-hf_cross
docker: https://hub.docker.com/r/kail4ek/arm-linux-hf_cross/

Good guide: http://wiki.bigfug.com/view/Cross_Compile_Fugio_To_Raspberry_Pi

To set correct sysroot of RPi usage described here: https://sysprogs.com/w/fixing-rpath-link-issues-with-cross-compilers/  
In short:  
	- Set -rpath-link  
	- Set direct paths to $SYSROOT/etc/ld.so.conf

Scripts configured for   
	OpenCV 3.1.0,   
	Eigen 3.3.1,   
	TBB 20160908 release,   
	qt 5.8,   
	OpenBLAS 0.2.19  
	OpenNI  
	
Scripts are configured for compilation inside Docker container

TBB repo: 	https://github.com/wjakob/tbb.git  
Eigen repo: 	https://bitbucket.org/eigen/eigen/ - Mercurial (hg)  
Qt5 repo: 	https://code.qt.io/cgit/qt/qt5.git/  
OpenCV repo: 	https://github.com/opencv/opencv   
OpenBLAS repo:	https://github.com/xianyi/OpenBLAS
OpenNI repo: https://github.com/occipital/OpenNI2

BananaPi M1 gcc 4.6 OpenCV compile "-D WITH_JASPER=OFF"
