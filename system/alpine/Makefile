default:
	podman build -o type=local,dest=./rootfs --net=host --platform=linux/arm64 -t alpine-rootfs .
	podman image prune -f

run:
	podman run -it --rm --net=host --platform=linux/arm64 alpine-rootfs /bin/sh
