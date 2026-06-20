FROM alpine:3.23.4 AS builder

RUN apk update && apk add --no-cache \
    alpine-base \
    parted \
    e2fsprogs-extra \
    openssh

RUN rm -rf /var/cache/apk/*

RUN passwd -d root

COPY inittab /etc/inittab
COPY interfaces /etc/network/interfaces

# 修复引入 busybox-suid 导致的权限问题
RUN echo UNKNOWN >> /etc/securetty
RUN chmod +r /bin/bbsuid

# resize 串口终端 window size
RUN echo "resize > /dev/null" >> /etc/profile

# 替换默认的 ntpd 配置，使用阿里云和腾讯云的 NTP 服务器
RUN sed -i "s|^#\?NTPD_OPTS=.*|NTPD_OPTS=\"-N -p ntp.aliyun.com -p ntp.tencent.com\"|" /etc/conf.d/ntpd

# 配置开启自启服务
RUN rc-update add devfs boot && \
    rc-update add sysfs boot && \
    rc-update add networking && \
    rc-update add ntpd && \
    rc-update add sshd


FROM scratch AS exporter
COPY --from=builder / /
