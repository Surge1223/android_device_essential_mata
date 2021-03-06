#
# Copyright 2018 The Android Open Source Project
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
#

# Inherit from the common Open Source product configuration

# Get the full APNs

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline.mk)

$(call inherit-product, device/essential/mata/device.mk)

PRODUCT_PACKAGES += \
    Dialer \
    WallpaperPicker \
    netutils-wrapper-1.0 \
    vndk_package \
    WallpaperPicker


PRODUCT_COPY_FILES += \
    device/essential/mata/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml


PRODUCT_MANUFACTURER := Essential Products
PRODUCT_BRAND := essential
PRODUCT_NAME := aosp_mata
PRODUCT_DEVICE := mata
PRODUCT_MODEL := PH-1
