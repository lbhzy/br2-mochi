include $(sort $(wildcard $(BR2_EXTERNAL_MOCHI_PATH)/package/*/*.mk))

run:
	@echo -e "\033[33m[INFO] Press 'Ctrl+a' then 'x' to terminate QEMU\033[0m"
	qemu-system-aarch64 \
		-machine virt \
		-m 2G \
		-smp 4 \
		-cpu cortex-a57 \
		-nographic \
		-kernel $(BINARIES_DIR)/Image \
		-drive if=none,file=$(BINARIES_DIR)/rootfs.ext4,format=raw,id=hd0 \
    	-device virtio-blk-device,drive=hd0 \
		-append "console=ttyAMA0 root=/dev/vda rootwait rw"