#!/usr/bin/env bash

set -e

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source ~/.cargo/env

rustup target add arm-unknown-linux-gnueabihf
