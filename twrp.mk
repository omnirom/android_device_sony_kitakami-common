#
# This is for TWRP Recovery
#

COMMON_PATH := device/sony/kitakami-common
TWRP_OUT := recovery/root

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/pulldecryptfiles.sh:$(TWRP_OUT)/sbin/pulldecryptfiles.sh

PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:$(TWRP_OUT)/system/usr/share/zoneinfo/tzdata
