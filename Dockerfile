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
RUN wget https://releases.linaro.org/components/toolchain/binaries/latest-6/arm-linux-gnueabihf/gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf.tar.xz -q && \
	tar xf gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf.tar.xz && \
	rsync -a gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf/ /usr/ && \
	rm -rf gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf.tar.xz

RUN apt-get install make nano cmake autoconf -y
RUN apt-get install qemu-user qemu-user-static -y

ENV HOST           arm-linux-gnueabihf
ENV HOST_TOOLCHAIN /usr/${HOST}
ENV QEMU_LD_PREFIX ${HOST_TOOLCHAIN}/libc
ENV AS=/usr/bin/${HOST}-as \
    AR=/usr/bin/${HOST}-ar \
    CC=/usr/bin/${HOST}-gcc \
    CPP=/usr/bin/${HOST}-cpp \
    CXX=/usr/bin/${HOST}-g++ \
    LD=/usr/bin/${HOST}-ld \ 
    LD_LIBRARY_PATH="${HOST_TOOLCHAIN}/libc/lib:${HOST_TOOLCHAIN}/libc/usr/lib:${HOST_TOOLCHAIN}/lib"

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
