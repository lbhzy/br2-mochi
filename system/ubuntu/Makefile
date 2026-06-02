IMAGE_NAME := ubuntu-rootfs
OPTIONS := --net=host --platform=linux/arm64
COMMAND := bash

default:
	podman build -o type=local,dest=./rootfs $(OPTIONS) -t $(IMAGE_NAME) .
	podman image prune -f

run:
	podman run -it --rm $(OPTIONS) $(IMAGE_NAME) $(COMMAND)
