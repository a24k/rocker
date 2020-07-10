#!/usr/bin/env bash

# norust
echo "docker build for arm-unknown-linux-gnueabihf (armv6hf) with no rust"
docker build --rm \
    -t a24k/rocker:latest-armv6hf-norust \
    ./norust

# rust
echo "docker build for arm-unknown-linux-gnueabihf (armv6hf)"
docker build --rm \
    -t a24k/rocker:latest-armv6hf \
    -t a24k/rocker:latest-armv6hf-rust \
    ./rust

# rust-alsa
echo "docker build for arm-unknown-linux-gnueabihf (armv6hf) with alsa library"
docker build --rm \
    -t a24k/rocker:latest-armv6hf-alsa \
    ./alsa

# rust-alsa_bcm2835
echo "docker build for arm-unknown-linux-gnueabihf (armv6hf) with alsa + bcm2835 library"
docker build --rm \
    -t a24k/rocker:latest-armv6hf-alsa_bcm2835 \
    ./alsa_bcm2835

# prune images
docker image prune -f
