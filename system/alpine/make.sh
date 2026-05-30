#!/bin/sh

# 获取并切换到脚本所在的绝对路径
SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
cd "$SCRIPT_DIR"

export ARCH=aarch64
export APK_OPTS="--arch $ARCH --allow-untrusted"
export KEYS_DIR=keys/for/$ARCH/packages

mkdir -p rootfs
./alpine-make-rootfs -p "apk-tools openrc" -c rootfs/ setup.sh