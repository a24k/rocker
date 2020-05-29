#!/usr/bin/env bash

echo "docker build for arm-unknown-linux-gnueabihf with alsa library"
docker build --rm -t rust-cross-alsa:arm-linux-gnueabihf .
