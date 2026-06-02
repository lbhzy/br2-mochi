IMAGE_NAME := ubuntu-rootfs
OPTIONS := --net=host --platform=linux/arm64
COMMAND := bash

default:
	podman build -o type=local,dest=./rootfs $(OPTIONS) -t $(IMAGE_NAME) .
	podman image prune -f

run:
	@podman image exists $(IMAGE_NAME) || (echo "Image $(IMAGE_NAME) not found. Please run 'make' to build the image first." && exit 1)
	podman run -it --rm $(OPTIONS) $(IMAGE_NAME) $(COMMAND)

clean:
	rm -rf rootfs

.PHONY: default run clean
