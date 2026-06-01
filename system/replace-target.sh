#!/bin/sh

cd "$(dirname "$(readlink -f "$0")")"

TARGET_DIR="$1"
ROOTFS_DIR="$2/rootfs"

rm -rf $TARGET_DIR
mkdir -p $TARGET_DIR

cp -a $ROOTFS_DIR/* $TARGET_DIR/

# 防止 buildroot 第二次编译报错
rm -f "${TARGET_DIR}/etc/ld.so.conf"
rm -rf "${TARGET_DIR}/etc/ld.so.conf.d"
