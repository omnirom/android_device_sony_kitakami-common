#
# This is for TWRP Recovery
#

COMMON_PATH := device/sony/kitakami-common
TWRP_OUT := recovery/root

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/twrp.fstab:$(TWRP_OUT)/etc/twrp.fstab \
    $(COMMON_PATH)/rootdir/pulldecryptfiles.sh:$(TWRP_OUT)/sbin/pulldecryptfiles.sh \
    $(COMMON_PATH)/rootdir/sbin/twrp-qseecomd:$(TWRP_OUT)/sbin/qseecomd

PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:$(TWRP_OUT)/system/usr/share/zoneinfo/tzdata
