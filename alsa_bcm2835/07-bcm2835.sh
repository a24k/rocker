#!/usr/bin/env bash

set -e

TARGET="arm-linux-gnueabihf"

PREFIX=/usr/local/$TARGET
PARALLEL_MAKE=-j2

CC=$TARGET-gcc

FILENAME_VERSION=bcm2835-1.64

wget -nc http://www.airspayce.com/mikem/bcm2835/$FILENAME_VERSION.tar.gz

tar xfk $FILENAME_VERSION.tar.gz

cd $FILENAME_VERSION

./configure --host=$TARGET --prefix=$PREFIX
make
make install-strip

cd ..
rm -rf *
