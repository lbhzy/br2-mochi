FROM debian:13-slim AS builder

# 设置环境变量，避免交互式安装提示
ENV DEBIAN_FRONTEND=noninteractive

# 更换 apt 源
RUN cp /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources.bak && \
    sed -i 's|http://deb.debian.org|http://mirrors.tuna.tsinghua.edu.cn|g' /etc/apt/sources.list.d/debian.sources

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    "?priority(important)" \
    systemd-timesyncd \
    lsof \
    wget \
    bash-completion \
    curl \
    dialog \
    parted \
    bsdextrautils \
    network-manager \
    wpasupplicant \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 允许 root 用户无密码登录
RUN passwd -d root

# 配置 ntp 服务器
RUN sed -i 's|^#NTP=.*|NTP=ntp.aliyun.com ntp1.aliyun.com ntp2.aliyun.com ntp3.aliyun.com|' /etc/systemd/timesyncd.conf

# 配置 CST 时区
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# 禁用不必要的服务
RUN systemctl mask cron.service && \
    systemctl mask e2scrub_reap.service && \
    systemctl mask networking.service  && \
    systemctl mask NetworkManager-wait-online.service && \
    systemctl mask systemd-pstore.service

# 打印已启用的服务
RUN systemctl list-unit-files --type=service --state=enabled

FROM scratch AS exporter
COPY --from=builder / /