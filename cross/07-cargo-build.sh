#!/usr/bin/env bash

set -e

export PKG_CONFIG_ALLOW_CROSS=1
export PKG_CONFIG_PATH=/usr/local/arm-linux-gnueabihf/lib/pkgconfig

cargo build --release --target arm-unknown-linux-gnueabihf
