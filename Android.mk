#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),2026)
  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.default.so
GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so
$(GATEKEEPER_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf libSoftGatekeeper.so $@

GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.mt6765.so
GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.k65v1_64_bsp.so
GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.mt6765.so
GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.k65v1_64_bsp.so
$(GATEKEEPER_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf libMcGatekeeper.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(GATEKEEPER_SYMLINK)

KMSETKEY_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/kmsetkey.default.so
KMSETKEY_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/kmsetkey.default.so
$(KMSETKEY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf kmsetkey.trustonic.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(KMSETKEY_SYMLINK)

endif