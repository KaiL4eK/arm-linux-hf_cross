# arm-linux-hf_cross
docker: https://hub.docker.com/r/kail4ek/arm-linux-hf_cross/

Good guide: http://wiki.bigfug.com/Cross_Compile_Fugio_To_Raspberry_Pi

To set correct sysroot of RPi usage described here: https://sysprogs.com/w/fixing-rpath-link-issues-with-cross-compilers/  
In short:  
	- Set -rpath-link  
	- Set direct paths to $SYSROOT/etc/ld.so.conf

Scripts configured for OpenCV 3.1.0, Eigen 3.3.1, TBB 20160908 release, qt 5.3.2
Scripts are configured for compilation inside Docker container

TBB repo: 	https://github.com/wjakob/tbb.git  
Eigen repo: 	https://bitbucket.org/eigen/eigen/ - Mercurial (hg)  
Qt5 repo: 	https://code.qt.io/cgit/qt/qt5.git/  
OpenCV repo: 	https://github.com/opencv/opencv   

