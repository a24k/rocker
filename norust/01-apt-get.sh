#!/usr/bin/env bash

set -e

apt update -y
apt upgrade -y

DEBIAN_FRONTEND=noninteractive \
apt install -y \
    build-essential \
    texinfo \
    wget \
    gawk \
    python3 \
    bison \
    git \
    curl \
    pkg-config
