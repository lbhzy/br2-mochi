IMAGE_NAME := archlinux-rootfs
OPTIONS := --net=host --platform=linux/arm64
COMMAND := bash

default:
	podman build --target builder $(OPTIONS) -t $(IMAGE_NAME) .
	podman build --target exporter -o type=local,dest=./rootfs $(OPTIONS) .
	podman image prune -f

run:
	@podman image exists $(IMAGE_NAME) || (echo "Image $(IMAGE_NAME) not found. Please run 'make' to build the image first." && exit 1)
	podman run -it --rm $(OPTIONS) $(IMAGE_NAME) $(COMMAND)

dl:
	wget http://os.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz

clean:
# 	unshare -rrm rm -rf rootfs
	rm -rf rootfs

.PHONY: default run clean dl
