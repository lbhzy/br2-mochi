FROM docker.io/menci/archlinuxarm:base AS builder

RUN sed -i '1i\Server = http://mirrors.tuna.tsinghua.edu.cn/archlinuxarm/$arch/$repo' /etc/pacman.d/mirrorlist
RUN sed -i 's|#DisableSandboxFilesystem|DisableSandboxFilesystem|g' /etc/pacman.conf
RUN sed -i 's|#DisableSandboxSyscalls|DisableSandboxSyscalls|g' /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
	parted \
	vim nano \
    which lsof htop \
    usbutils libgpiod \
    networkmanager

# workaround 规避 buildroot 报错
RUN rm -rf /run/systemd/dissect-root /etc/ld.so.conf /etc/ld.so.conf.d && \
    chmod +r /usr/lib/dbus-daemon-launch-helper && \
    chmod u+w /etc/ca-certificates/extracted/cadir/

# 允许 root 用户无密码登录
RUN passwd -d root

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 配置串口终端 TERM 类型
RUN mkdir -p /etc/systemd/system/serial-getty@.service.d && \
    printf '[Service]\nEnvironment="TERM=xterm-256color"\n' > /etc/systemd/system/serial-getty@.service.d/override.conf

# 使能必要服务
RUN systemctl enable NetworkManager && \
    systemctl enable systemd-timesyncd

RUN systemctl list-unit-files --type=service --state=enabled

FROM scratch AS exporter
COPY --from=builder / /
