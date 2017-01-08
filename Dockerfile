FROM ubuntu:14.04

RUN apt-get update

RUN mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer && \
    chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

RUN apt-get install xz-utils rsync wget gcc g++ make nano autoconf lib32z1 python -y

WORKDIR /tmp
RUN wget https://releases.linaro.org/components/toolchain/binaries/4.9-2016.02/arm-linux-gnueabihf/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz -q && \
	tar xf gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz && \
	rsync -a gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf/ /usr/ && \
	rm -rf gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz

RUN wget https://cmake.org/files/v3.7/cmake-3.7.1.tar.gz -q && \
	tar xzvf cmake-3.7.1.tar.gz && \
	cd cmake-3.7.1 && \
	./bootstrap && \
	make install -j4 && \
	cd .. && rm -rf cmake-3.7.1.tar.gz cmake-3.7.1/

ADD sysroot_rpi.tar.gz /usr/
#	tar zxf sysroot_rpi.tar.gz && \
#	rsync -a sysroot /usr/ && \
#	rm -rf sysroot sysroot_rpi.tar.gz

ADD rpi-toolchain.cmake /usr/

ENV TARGET           arm-linux-gnueabihf
ENV TARGET_TOOLCHAIN /usr/${TARGET}
ENV TARGET_SYSROOT   /usr/sysroot
ENV TARGET_CMAKE_TOOLCHAIN /usr/rpi-toolchain.cmake

ENV AS=/usr/bin/${TARGET}-as \
    AR=/usr/bin/${TARGET}-ar \
    CC=/usr/bin/${TARGET}-gcc \
    CFLAGS=-mcpu=cortex-a7 \
    CPP=/usr/bin/${TARGET}-cpp \
    CXX=/usr/bin/${TARGET}-g++ \
    CXXFLAGS=-mcpu=cortex-a7 \
    LD=/usr/bin/${TARGET}-ld \ 
    LD_LIBRARY_PATH="${TARGET_TOOLCHAIN}/libc/lib:${TARGET_TOOLCHAIN}/libc/usr/lib:${TARGET_TOOLCHAIN}/lib"

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
