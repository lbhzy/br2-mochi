IMAGE_NAME := ubuntu-rootfs
OPTIONS := --net=host --platform=linux/arm64
COMMAND := bash

default:
	podman build --target builder $(OPTIONS) -t $(IMAGE_NAME) .
	podman build --target exporter -o type=local,dest=./rootfs $(OPTIONS) .
	podman image prune -f
	echo "ubuntu" > rootfs/etc/hostname
	rm -rf rootfs/etc/resolv.conf

run:
	@podman image exists $(IMAGE_NAME) || (echo "Image $(IMAGE_NAME) not found. Please run 'make' to build the image first." && exit 1)
	podman run -it --rm $(OPTIONS) $(IMAGE_NAME) $(COMMAND)

clean:
	rm -rf rootfs

.PHONY: default run clean
