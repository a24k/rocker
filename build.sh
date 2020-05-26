#!/usr/bin/env bash

echo "docker build for arm-unknown-linux-musleabihf with audio libraries"
docker build --rm --no-cache -t rust-musl-cross-audio:arm-musleabihf .
