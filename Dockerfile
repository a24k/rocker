FROM a24k/rocker:latest-armv6hf-norust

COPY ./cross /host

WORKDIR /tmp

RUN /host/05-rustup.sh
RUN /host/06-alsa.sh

ENV PATH=/root/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PKG_CONFIG_ALLOW_CROSS=1 \
    PKG_CONFIG_PATH=/usr/local/arm-linux-gnueabihf/lib/pkgconfig

RUN mkdir -p /project

WORKDIR /project
