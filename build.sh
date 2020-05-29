#!/usr/bin/env bash

echo "docker build for arm-unknown-linux-gnueabihf (armv6hf) with alsa library"
docker build --rm -t a24k/rocker:latest-armv6hf-alsa .
