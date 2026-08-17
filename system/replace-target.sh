#!/bin/sh

set -e
cd "$(dirname "$(readlink -f "$0")")"

TARGET_DIR="$1"
ROOTFS_DIR="$2/rootfs"

# 清理目标目录
EMPTY_DIR=$(mktemp -d)
rsync -a --delete \
    --exclude='/boot' \
    --exclude='/lib/firmware' \
    --exclude='/lib/modules' \
    --exclude='/usr/lib/firmware' \
    --exclude='/usr/lib/modules' \
    "${EMPTY_DIR}/" "${TARGET_DIR}/"
rmdir "${EMPTY_DIR}"

cp -a "$ROOTFS_DIR/." $TARGET_DIR/

# 防止 buildroot 第二次编译报错
rm -f "${TARGET_DIR}/etc/ld.so.conf"
rm -rf "${TARGET_DIR}/etc/ld.so.conf.d"
