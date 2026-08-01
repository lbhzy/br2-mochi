FROM scratch AS builder
ADD ArchLinuxARM-aarch64-latest.tar.gz /
RUN rm -rf boot lib/modules lib/firmware
RUN rm -f /etc/ld.so.conf
RUN rm -rf /etc/ld.so.conf.d
RUN chmod u+w /etc/ca-certificates/extracted/cadir/
RUN chmod +r /usr/lib/dbus-daemon-launch-helper

RUN sed -i 's/#IgnorePkg   =/IgnorePkg   = linux-aarch64 linux-firmware/g' /etc/pacman.conf
RUN pacman-key --init && pacman-key --populate archlinuxarm
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm parted

FROM scratch AS exporter
COPY --from=builder / /
