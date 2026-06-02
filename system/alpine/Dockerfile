FROM alpine:3.23.4 AS builder

RUN apk update && apk add --no-cache \
    alpine-base

RUN rm -rf /var/cache/apk/*

RUN passwd -d root

COPY inittab /etc/inittab

# 修复引入 busybox-suid 导致的权限问题
RUN echo UNKNOWN >> /etc/securetty
RUN chmod +r /bin/bbsuid

FROM scratch AS exporter
COPY --from=builder / /
