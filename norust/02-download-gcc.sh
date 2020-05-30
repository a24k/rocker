#!/usr/bin/env bash

set -e

BINUTILS_VERSION=binutils-2.34
GCC_VERSION=gcc-9.3.0
LINUX_KERNEL_VERSION=linux-4.19.76
GLIBC_VERSION=glibc-2.31

wget -nc http://ftpmirror.gnu.org/binutils/$BINUTILS_VERSION.tar.gz
wget -nc http://ftpmirror.gnu.org/gcc/$GCC_VERSION/$GCC_VERSION.tar.gz
wget -nc https://cdn.kernel.org/pub/linux/kernel/v4.x/$LINUX_KERNEL_VERSION.tar.xz
wget -nc http://ftpmirror.gnu.org/glibc/$GLIBC_VERSION.tar.xz

for f in *.tar*; do
    tar xfk $f
done

cd $GCC_VERSION
./contrib/download_prerequisites

cd ..
patch -up0 < /host/02-gcc_libsanitizer.patch
