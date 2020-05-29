FROM ubuntu:20.04

COPY ./cross /host

WORKDIR /tmp

RUN /host/01-apt-get.sh && \
        /host/02-download-gcc.sh && \
        /host/03-build-gcc.sh && \
        /host/04-cleanup.sh && \
        /host/05-rustup.sh && \
        /host/06-alsa.sh

ENV PATH=/root/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PKG_CONFIG_ALLOW_CROSS=1 \
    PKG_CONFIG_PATH=/usr/local/arm-linux-gnueabihf/lib/pkgconfig

RUN mkdir -p /project

WORKDIR /project
