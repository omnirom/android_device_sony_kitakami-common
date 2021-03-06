# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Platform path
PLATFORM_COMMON_PATH := device/sony/kitakami-common

$(call inherit-product, device/sony/common/common_omni.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

SOMC_PLATFORM := kitakami
PRODUCT_PLATFORM := $(SOMC_PLATFORM)

SONY_ROOT := $(PLATFORM_COMMON_PATH)/rootdir

# We use caf hals for media / display and audio
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
TARGET_QCOM_DISPLAY_VARIANT := caf-msm8992
TARGET_QCOM_MEDIA_VARIANT := caf-msm8992
TARGET_QCOM_AUDIO_VARIANT := caf-msm8992

# GPU
BOARD_USES_ADRENO := true
TARGET_BOARD_PLATFORM_GPU := qcom-adreno418.

# CNE
BOARD_USES_QCNE := true

# We use stock camera blobs
USE_CAMERA_STUB := true

# kernel
TARGET_KERNEL_SOURCE := kernel/sony/msm8994

# Enable features in video HAL that can compile only on this platform
TARGET_USES_MEDIA_EXTENSIONS := true

TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    $(SONY_ROOT)/system/etc/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(SONY_ROOT)/system/etc/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml \
    $(SONY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(SONY_ROOT)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(SONY_ROOT)/system/etc/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# Broadcom BT
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/idc/clearpad.idc:system/usr/idc/clearpad.idc \
    $(SONY_ROOT)/system/usr/idc/touch_fusion.idc:system/usr/idc/touch_fusion.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(SONY_ROOT)/system/usr/keylayout/mhl-rcp.kl:system/usr/keylayout/mhl-rcp.kl \
    $(SONY_ROOT)/system/usr/keylayout/msm8994-tomtom-snd-card_Button_Jack.kl:system/usr/keylayout/msm8994-tomtom-snd-card_Button_Jack.kl

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/msm_irqbalance.conf:system/etc/msm_irqbalance.conf

# GTS
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/gts_config_list.txt:system/etc/gts_config_list.txt

# RQBalance-PowerHAL configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/rqbalance_config.xml:system/etc/rqbalance_config.xml

# Device Specific Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:/system/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:/system/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/etc/usb_audio_policy_configuration.xml

DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_COMMON_PATH)/overlay

# Platform Init
PRODUCT_PACKAGES += \
    fstab.kitakami \
    init.kitakami.pwr \
    init.qcom.qseecomd

# NFC packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8994 \
    audio.a2dp.default \
    audio_policy.msm8994 \
    audio.r_submix.default \
    audio.usb.default \
    audio_amplifier.msm8994 \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# GFX
PRODUCT_PACKAGES += \
    copybit.msm8994 \
    gralloc.msm8994 \
    hwcomposer.msm8994 \
    memtrack.msm8994 \
    liboverlay

# GPS
PRODUCT_PACKAGES += \
    gps.msm8952 \
    libgnsspps \
    libcurl

PRODUCT_PACKAGES += \
    flp.conf \
    gps.conf \
    izat.conf \
    lowi.conf \
    sap.conf \
    xtwifi.conf

# Extra tools
PRODUCT_PACKAGES += \
    tinycap \
    tinymix \
    tinypcminfo \
    tinyplay \
    libtinyxml

# IPA
PRODUCT_PACKAGES += \
    ipacm \
    ipacm-diag \
    IPACM_cfg.xml

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libdivxdrmdecrypt \
    libOmxSwVencMpeg4 \
    libOmxVidcCommon \
    libstagefrighthw

# lib shim
PRODUCT_PACKAGES += \
    libshim_wvm \
    libshim_imsvt

# Snapdragon Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    telephony-ext \
    rcscommon \
    rcscommon.xml

# GPS
PRODUCT_PACKAGES += \
    gps.msm8994

# Keymaster
PRODUCT_PACKAGES += \
    keystore.msm8994

# Sensor multihal
PRODUCT_PACKAGES += \
    sensors.msm8994

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    brcm-uim-sysfs \
    libfmjni

# Default properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.semc.version.sw=1295-7444 \
    ro.semc.version.sw_variant=GLOBAL-LTE2A \
    ro.semc.version.sw_revision=32.3.A.2.33 \
    ro.semc.version.fs_revision=32.3.A.2.33

ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.semc.version.sw_type=user
endif

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.semc.version.cust=OmniROM \
    ro.semc.version.cust_revision=$(PLATFORM_VERSION)_$(BUILD_ID)

# TWRP
$(call inherit-product, device/sony/kitakami-common/twrp.mk)
