#!/usr/bin/env bash

set -e

apt update -y
apt upgrade -y

DEBIAN_FRONTEND=noninteractive \
apt install -y \
    build-essential \
    texinfo \
    gawk \
    less \
    wget \
    curl \
    cmake \
    file \
    git \
    sudo \
    xutils-dev \
    unzip \
    vim-tiny \
    binutils \
    gcc \
    python3 \
    bison \
    && \
apt clean
