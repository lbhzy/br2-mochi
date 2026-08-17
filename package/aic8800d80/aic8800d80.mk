AIC8800D80_VERSION = main
AIC8800D80_SITE = https://github.com/shenmintao/aic8800d80.git
AIC8800D80_SITE_METHOD = git
AIC8800D80_MODULE_SUBDIRS = drivers/aic8800

define AIC8800D80_INSTALL_FIRMWARE
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware
	cp -a $(@D)/fw/aic8800* $(TARGET_DIR)/lib/firmware/
endef

AIC8800D80_POST_INSTALL_TARGET_HOOKS += AIC8800D80_INSTALL_FIRMWARE

$(eval $(kernel-module))
$(eval $(generic-package))
