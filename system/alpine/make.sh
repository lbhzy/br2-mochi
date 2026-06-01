#!/bin/sh

# 切换到脚本所在的绝对路径
cd "$(dirname "$(readlink -f "$0")")"

mkdir -p rootfs

# 构建 Docker 镜像并导出根文件系统
podman build -t alpine-rootfs --net=host --platform=linux/arm64 .
podman create --name alpine-rootfs-container --platform=linux/arm64 alpine-rootfs
podman export alpine-rootfs-container | tar -C rootfs/ -xvf -
podman rm alpine-rootfs-container
