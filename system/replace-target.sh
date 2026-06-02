#!/bin/sh

set -e
cd "$(dirname "$(readlink -f "$0")")"

TARGET_DIR="$1"
ROOTFS_DIR="$2/rootfs"

# 清理目标目录，保留 boot 目录
find "${TARGET_DIR}" -maxdepth 1 -not -name "$(basename "${TARGET_DIR}")" -not -name "boot" -exec rm -rf {} +

cp -a "$ROOTFS_DIR/." $TARGET_DIR/

# 防止 buildroot 第二次编译报错
rm -f "${TARGET_DIR}/etc/ld.so.conf"
rm -rf "${TARGET_DIR}/etc/ld.so.conf.d"
