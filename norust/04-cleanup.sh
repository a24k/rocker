#!/usr/bin/env bash

set -e

apt purge -y --auto-remove texinfo gawk python3 bison
apt clean
rm -rf /var/lib/apt/lists/*

rm -rf *
