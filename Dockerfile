FROM ubuntu:14.04

RUN apt-get update

RUN mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer && \
    chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

RUN apt-get install xz-utils rsync wget -y

WORKDIR /tmp
RUN wget https://releases.linaro.org/components/toolchain/binaries/4.9-2016.02/arm-linux-gnueabihf/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz -q && \
	tar xf gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz && \
	rsync -a gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf/ /usr/ && \
	rm -rf gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf.tar.xz

RUN apt-get install make nano cmake autoconf -y
#RUN apt-get install qemu-user qemu-user-static -y

ENV TARGET           arm-linux-gnueabihf
ENV TARGET_TOOLCHAIN /usr/${TARGET}
ENV QEMU_LD_PREFIX ${TARGET_TOOLCHAIN}/libc
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
