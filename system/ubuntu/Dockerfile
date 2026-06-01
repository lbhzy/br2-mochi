FROM ubuntu:26.04

# 设置环境变量，避免交互式安装提示
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    systemd \
    systemd-sysv \
    udev \
    dbus \
    kmod \
    bash

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 允许 root 用户无密码登录
RUN passwd -d root
