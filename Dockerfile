FROM messense/rust-musl-cross:arm-musleabihf

ARG TOOLCHAIN=stable
ARG TARGET=arm-unknown-linux-musleabihf
ARG ALSA_ARCH=arm-unknown-linux
ARG PA_ARCH=arm-unknown-linux

RUN apt-get update && \
    apt-get install -y \
        pkg-config \
        wget \
        libasound2-dev \
        && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

###END###

RUN mkdir -p /home/rust/libs /home/rust/src

# musl-gcc toolchain and for our Rust toolchain.
ENV PATH=/root/.cargo/bin:/usr/local/musl/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV TARGET_CC=$TARGET-gcc
ENV TARGET_CXX=$TARGET-g++
ENV TARGET_C_INCLUDE_PATH=/usr/local/musl/$TARGET/include/

# We'll build our libraries in subdirectories of /home/rust/libs.  Please
# clean up when you're done.
WORKDIR /home/rust/libs

# Build a shared library version of ALSA using musl-libc.
RUN export CC=$TARGET_CC && \
    export C_INCLUDE_PATH=$TARGET_C_INCLUDE_PATH && \
    echo "$CC $C_INCLUDE_PATH" && \
    echo "Building ALSA" && \
    VERS=1.2.2 && \
    CHECKSUM=82cdc23a5233d5ed319d2cbc89af5ca5 && \
    curl -sqOL https://www.alsa-project.org/files/pub/lib/alsa-lib-$VERS.tar.bz2 && \
    echo "$CHECKSUM alsa-lib-$VERS.tar.bz2" > checksums.txt && \
    md5sum -c checksums.txt && \
    tar xjf alsa-lib-$VERS.tar.bz2 && cd alsa-lib-$VERS && \
    ./configure --host=$ALSA_ARCH --enable-shared=no --enable-static=yes --prefix=/usr/local/musl/$TARGET && \
    make install && \
    cd .. && rm -rf alsa-lib-$VERS.tar.bz2 alsa-lib-$VERS checksums.txt

ENV ALSA_DIR=/usr/local/musl/$TARGET/ \
    ALSA_INCLUDE_DIR=/usr/local/musl/$TARGET/include/ \
    DEP_ALSA_INCLUDE=/usr/local/musl/$TARGET/include/ \
    ALSA_LIB_DIR=/usr/local/musl/$TARGET/lib/ \
    ALSA_STATIC=1

# Build a static library version of PortAudio using musl-libc.
RUN export CC=$TARGET_CC && \
    export C_INCLUDE_PATH=$TARGET_C_INCLUDE_PATH && \
    echo "$CC $C_INCLUDE_PATH" && \
    echo "Building PortAudio" && \
    VERS=v190600_20161030 && \
    curl -sqOL http://www.portaudio.com/archives/pa_stable_$VERS.tgz && \
    tar xzf pa_stable_$VERS.tgz && cd portaudio && \
    ./configure --host=$PA_ARCH --enable-shared=no --enable-static=yes --prefix=/usr/local/musl/$TARGET && \
    make install && \
    cd .. && rm -rf ps_stable_$VERS.tgz portaudio

ENV PA_DIR=/usr/local/musl/$TARGET/ \
    PA_INCLUDE_DIR=/usr/local/musl/$TARGET/include/ \
    DEP_PA_INCLUDE=/usr/local/musl/$TARGET/include/ \
    PA_LIB_DIR=/usr/local/musl/$TARGET/lib/ \
    PA_STATIC=1

# Expect our source code to live in /home/rust/src
WORKDIR /home/rust/src
