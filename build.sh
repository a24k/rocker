#!/usr/bin/env bash

# norust
echo "docker build for arm-unknown-linux-gnueabihf (armv6hf) with no rust"
docker build --rm -t a24k/rocker:latest-armv6hf-norust ./norust

# rust
echo "docker build for arm-unknown-linux-gnueabihf (armv6hf)"
docker build --rm -t a24k/rocker:latest-armv6hf ./rust

# rust-alsa
echo "docker build for arm-unknown-linux-gnueabihf (armv6hf) with alsa library"
docker build --rm -t a24k/rocker:latest-armv6hf-alsa ./alsa

# prune images
docker image prune -f
