# Copyright 2014 The Android Open Source Project
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

include device/sony/kitakami-common/PlatformConfig.mk

# We use caf hals for media / display
TARGET_QCOM_DISPLAY_VARIANT := caf-msm8992
TARGET_QCOM_MEDIA_VARIANT := caf-msm8992

# We use stock camera blobs
USE_CAMERA_STUB := true

# Multihal
USE_SENSOR_MULTI_HAL := true

# cryptfs hw
TARGET_HW_DISK_ENCRYPTION := true

#Camera
TARGET_USES_MEDIA_EXTENSIONS := true

#BCM BT/FM
BOARD_HAVE_BCM_FM_SYSFS := "/sys/bus/platform/drivers/bcm43xx_bluetooth/bcm43xx.81/"
