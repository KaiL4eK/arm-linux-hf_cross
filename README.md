# arm-linux-hf_cross
docker: https://hub.docker.com/r/kail4ek/arm-linux-hf_cross/

To set correct sysroot of RPi usage described here: https://sysprogs.com/w/fixing-rpath-link-issues-with-cross-compilers/  

In short:  
	- Set -rpath-link  
	- Set direct paths to $SYSROOT/etc/ld.so.conf
