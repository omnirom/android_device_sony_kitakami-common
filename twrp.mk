#
# This is for TWRP Recovery
#

COMMON_PATH := device/sony/kitakami-common
TWRP_OUT := recovery/root

TW_MAX_BRIGHTNESS := 255

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/twrp.fstab:$(TWRP_OUT)/etc/twrp.fstab \
    $(COMMON_PATH)/rootdir/sbin/pulldecryptfiles.sh:$(TWRP_OUT)/sbin/pulldecryptfiles.sh

PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:$(TWRP_OUT)/system/usr/share/zoneinfo/tzdata
