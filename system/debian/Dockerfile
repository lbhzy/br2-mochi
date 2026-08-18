FROM debian:13-slim AS builder

# 设置环境变量，避免交互式安装提示
ENV DEBIAN_FRONTEND=noninteractive

# 更换 apt 源
RUN cp /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources.bak && \
    sed -i 's|http://deb.debian.org|http://mirrors.tuna.tsinghua.edu.cn|g' /etc/apt/sources.list.d/debian.sources

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    task-ssh-server \
    udev \
    kmod \
    iproute2 \
    iputils-ping \
    systemd-resolved \  
    systemd-timesyncd \
    nano \
    adbd \
    usbutils \
    dialog \
    parted \
    bash-completion \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN systemctl list-unit-files --type=service --state=enabled


FROM scratch AS exporter
COPY --from=builder / /