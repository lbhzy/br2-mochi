#!/bin/sh

# 切换到脚本所在的绝对路径
cd "$(dirname "$(readlink -f "$0")")"

mkdir -p rootfs

# 构建 Docker 镜像并导出根文件系统
podman build -t ubuntu-rootfs --net=host --platform=linux/arm64 .
podman create --name ubuntu-rootfs-container --platform=linux/arm64 ubuntu-rootfs
podman export ubuntu-rootfs-container | tar -C rootfs/ -xvf -
podman rm ubuntu-rootfs-container
