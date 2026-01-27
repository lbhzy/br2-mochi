include $(sort $(wildcard $(BR2_EXTERNAL_MOCHI_PATH)/package/*/*.mk))

run:
	@echo -e "\033[33m[INFO] Press 'Ctrl+a' then 'x' to terminate QEMU\033[0m"
	qemu-system-aarch64 \
		-machine virt \
		-cpu cortex-a57 \
		-nographic \
		-kernel $(BINARIES_DIR)/Image \
		-append "console=ttyAMA0 rdinit=/init" \
		-initrd $(BINARIES_DIR)/rootfs.cpio