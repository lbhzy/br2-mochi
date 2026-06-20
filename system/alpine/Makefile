IMAGE_NAME := alpine-rootfs
OPTIONS := --net=host --platform=linux/arm64
COMMAND := /bin/sh

default:
	podman build --target builder $(OPTIONS) -t $(IMAGE_NAME) .
	podman build --target exporter -o type=local,dest=./rootfs $(OPTIONS) .
	podman image prune -f
	echo "alpine" > rootfs/etc/hostname

run:
	@podman image exists $(IMAGE_NAME) || (echo "Image $(IMAGE_NAME) not found. Please run 'make' to build the image first." && exit 1)
	podman run -it --rm $(OPTIONS) $(IMAGE_NAME) $(COMMAND)

clean:
	rm -rf rootfs

.PHONY: default run clean
