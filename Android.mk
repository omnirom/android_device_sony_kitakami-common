ifeq ($(filter-out ivy karin karin_windy satsuki sumire suzuran,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

# IMS links
IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR_APPS)/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

# RFS symlinks
RFS_SYMLINKS := $(TARGET_OUT)/rfs
$(RFS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "RFS links"
	@rm -rf $(TARGET_OUT)/rfs 
	@mkdir -p $(TARGET_OUT)/rfs/apq/gnss/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT)/rfs/apq/gnss/hlos
	$(hide) ln -sf /data/tombstones/lpass $(TARGET_OUT)/rfs/apq/gnss/ramdumps
	$(hide) ln -sf /persist/rfs/apq/gnss $(TARGET_OUT)/rfs/apq/gnss/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT)/rfs/apq/gnss/shared
	$(hide) ln -sf /firmware $(TARGET_OUT)/rfs/apq/gnss/readonly/firmware
	@mkdir -p $(TARGET_OUT)/rfs/msm/adsp/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT)/rfs/msm/adsp/hlos
	$(hide) ln -sf /data/tombstones/lpass $(TARGET_OUT)/rfs/msm/adsp/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $(TARGET_OUT)/rfs/msm/adsp/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT)/rfs/msm/adsp/shared
	$(hide) ln -sf /firmware $(TARGET_OUT)/rfs/msm/adsp/readonly/firmware
	@mkdir -p $(TARGET_OUT)/rfs/msm/mpss/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT)/rfs/msm/mpss/hlos
	$(hide) ln -sf /data/tombstones/lpass $(TARGET_OUT)/rfs/msm/mpss/ramdumps
	$(hide) ln -sf /persist/rfs/msm/mpss $(TARGET_OUT)/rfs/msm/mpss/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT)/rfs/msm/mpss/shared
	$(hide) ln -sf /firmware $(TARGET_OUT)/rfs/msm/mpss/readonly/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_SYMLINKS)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
