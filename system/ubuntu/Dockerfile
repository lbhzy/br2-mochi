FROM ubuntu:26.04 AS builder

# 设置环境变量，避免交互式安装提示
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    systemd \
    systemd-sysv \
    udev \
    kmod \
    libbpf1 \
    iproute2 \
    iputils-ping \
    systemd-resolved \  
    systemd-timesyncd \
    nano \
    adbd \
    usbutils \
    dialog \
    parted

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 允许 root 用户无密码登录
RUN passwd -d root

# 删除默认用户
RUN userdel -r ubuntu

# 配置网络
RUN systemctl enable systemd-networkd
COPY 10-default.network /etc/systemd/network/

RUN systemctl list-unit-files --type=service --state=enabled


FROM scratch AS exporter
COPY --from=builder / /
