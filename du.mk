# Copyright (C) 2019 The Dirty Unicorns Project
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
# This file is the build configuration for an aosp Android
# build for marlin hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and du, hence its name.
#

# Include DU common configuration
include vendor/du/config/common_full_phone.mk

# Inherit from those products. Most specific first.
$(call inherit-product, device/essential/mata/aosp_mata.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)


# Override AOSP build properties
PRODUCT_NAME := du_mata
PRODUCT_DEVICE := mata
PRODUCT_MANUFACTURER := Essential Products
PRODUCT_BRAND := essential
PRODUCT_MODEL := PH-1

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=mata \
        BUILD_FINGERPRINT=essential/mata/mata:10/QP1A.190711.148/446:user/test-keys \
        PRIVATE_BUILD_DESC="mata-user 10 QP1A.190711.148 446 release-keys"

$(call inherit-product-if-exists, vendor/essential/mata/mata-vendor.mk)
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
