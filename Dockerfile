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

RUN apt-get install make nano cmake -y
#RUN apt-get install

ENV CROSS_TRIPLE arm-linux-gnueabihf
ENV CROSS_ROOT 	 /usr/${CROSS_TRIPLE}
ENV AS=/usr/bin/${CROSS_TRIPLE}-as \
    AR=/usr/bin/${CROSS_TRIPLE}-ar \
    CC=/usr/bin/${CROSS_TRIPLE}-gcc \
    CPP=/usr/bin/${CROSS_TRIPLE}-cpp \
    CXX=/usr/bin/${CROSS_TRIPLE}-g++ \
    LD=/usr/bin/${CROSS_TRIPLE}-ld \ 
    LD_LIBRARY_PATH=/usr/arm-linux-gnueabihf/libc/lib:/usr/arm-linux-gnueabihf/lib

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
