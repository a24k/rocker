#!/usr/bin/env bash

echo "docker build for arm-unknown-linux-musleabihf-alsa"
docker build --rm --no-cache -t rust-musl-cross-arm-musleabihf-alsa .
