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

SONY_ROOT = device/sony/kitakami-common/rootdir

# We use caf hals for media / display and audio
BOARD_USES_QCOM_HARDWARE := true
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

# cryptfs hw
TARGET_HW_DISK_ENCRYPTION := true

# kernel
TARGET_KERNEL_SOURCE := kernel/sony/msm8994

# Common config
include device/sony/kitakami-common/platform.mk

# IPA
PRODUCT_PACKAGES += \
    ipacm \
    ipacm-diag \
    IPACM_cfg.xml

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd

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

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# qseecomd
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/bin/init.qcom.qseecomd.sh:system/bin/init.qcom.qseecomd.sh

# Sensor multihal
PRODUCT_PACKAGES += \
    sensors.msm8994

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm8994 \
    audio.r_submix.default \
    audio.usb.default \
    audio_amplifier.msm8994 \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192

# Audio configuration files
PRODUCT_COPY_FILES += \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/audio_policy.conf:system/etc/audio_policy.conf \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/mixer_paths.xml:system/etc/mixer_paths.xml \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    hardware/qcom/audio-caf-msm8992/configs/msm8994/listen_platform_info.xml:system/etc/listen_platform_info.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:/system/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:/system/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/etc/usb_audio_policy_configuration.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# Copying files
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/twrp.fstab:recovery/root/etc/twrp.fstab

# CNE / DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1 \
    persist.dpm.feature=1

# TWRP
$(call inherit-product, device/sony/kitakami-common/twrp.mk)
