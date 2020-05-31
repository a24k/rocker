#!/usr/bin/env bash

set -e

TARGET="arm-linux-gnueabihf"

PREFIX=/usr/local/$TARGET
PARALLEL_MAKE=-j2

CC=$TARGET-gcc

FILENAME_VERSION=alsa-lib-1.2.2

wget -nc ftp://ftp.alsa-project.org/pub/lib/$FILENAME_VERSION.tar.bz2

tar xfk $FILENAME_VERSION.tar.bz2

patch -up0 < /host/06-alsa.patch

cd $FILENAME_VERSION

./configure --host=$TARGET --prefix=$PREFIX
make
make install

cd ..
rm -rf *
