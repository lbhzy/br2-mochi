FROM alpine:3.23.4

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk update && apk add --no-cache \
    openrc

RUN rm -rf /var/cache/apk/* \
    && rm -rf /usr/share/man \
    && rm -rf /usr/share/doc


RUN echo "root:root" | chpasswd

# 在 console 上运行 getty
RUN sed -i '/ttyS0/c ::respawn:/sbin/getty -L 0 console vt100' /etc/inittab

CMD ["/bin/sh"]
