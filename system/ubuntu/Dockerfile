FROM ubuntu:26.04 AS builder

# 设置环境变量，避免交互式安装提示
ENV DEBIAN_FRONTEND=noninteractive

# 更换 apt 源
RUN cp /etc/apt/sources.list.d/ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources.bak && \
    sed -i 's|http://ports.ubuntu.com|http://mirrors.tuna.tsinghua.edu.cn|g' /etc/apt/sources.list.d/ubuntu.sources

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
    parted \
    tzdata \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 允许 root 用户无密码登录
RUN passwd -d root

# 配置 TERM 类型
RUN mkdir -p /etc/systemd/system/serial-getty@.service.d && \
    printf '[Service]\nEnvironment="TERM=xterm-256color"\n' > /etc/systemd/system/serial-getty@.service.d/override.conf

# 删除默认用户
RUN userdel -r ubuntu

# 配置网络
RUN systemctl enable systemd-networkd && \
    printf "[Match]\nName=en*\n\n[Network]\nDHCP=yes\nDNSSEC=no\n" > /etc/systemd/network/en.network && \
    printf "[Match]\nName=eth*\n\n[Network]\nDHCP=yes\nDNSSEC=no\n" > /etc/systemd/network/eth.network

# 配置 CST 时区
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

RUN systemctl list-unit-files --type=service --state=enabled


FROM scratch AS exporter
COPY --from=builder / /
