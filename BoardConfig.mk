#
# Copyright (C) 2018 The Android Open-Source Project
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

TARGET_BOOTLOADER_BOARD_NAME := mata
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
TARGET_BOARD_PLATFORM := msm8998
TARGET_USES_AOSP := true

TARGET_BOARD_AUTO := true
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

BOARD_KERNEL_CMDLINE += androidboot.hardware=mata user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1
BOARD_KERNEL_CMDLINE += service_locator.enable=1 swiotlb=2048 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3
BOARD_KERNEL_CMDLINE += buildvariant=$(TARGET_BUILD_VARIANT) enforcing=0 androidboot.selinux=permissive

TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/essential/mata
TARGET_KERNEL_CONFIG := custom_defconfig
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_COMPILE_WITH_MSM_KERNEL := true

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

TARGET_NO_BOOTLOADER ?= true
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := device/essential/mata/recovery.wipe
TARGET_RECOVERY_FSTAB := device/essential/mata/fstab.mata

# Android Verified Boot (AVB):
#   Builds a special vbmeta.img that disables AVB verification.
#   Otherwise, AVB will prevent the device from booting the generic system.img.
#   Also checks that BOARD_AVB_ENABLE is not set, to prevent adding verity
#   metadata into system.img.

BOARD_AVB_ENABLE := false
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 #BOARD_KERNEL_PAGESIZE *64

TARGET_COPY_OUT_VENDOR := vendor

# Skip API checks.
WITHOUT_CHECK_API := true
# Don't try to build and run all tests by default. Several tests have
# dependencies on the framework.
ANDROID_NO_TEST_CHECK := true

BOARD_ROOT_EXTRA_FOLDERS := persist firmware metadata

# sepolicy
BOARD_SEPOLICY_DIRS += device/essential/mata/sepolicy
BOARD_SEPOLICY_DIRS += device/essential/mata/sepolicy/vendor
BOARD_PLAT_PUBLIC_SEPOLICY_DIR := device/essential/mata/sepolicy/public
BOARD_PLAT_PRIVATE_SEPOLICY_DIR := device/essential/mata/sepolicy/private

TARGET_ANDROID_FILESYSTEM_CONFIG_H := device/essential/mata/android_filesystem_config.h

QCOM_BOARD_PLATFORMS += msm8998
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/essential/mata/bluetooth

BOARD_USES_SYSTEM_OTHER_ODEX := true
# Enable dex pre-opt to speed up initial boot
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
    WITH_DEXPREOPT_PIC := true
    ifneq ($(TARGET_BUILD_VARIANT),user)
      # Retain classes.dex in APK's for non-user builds
      DEX_PREOPT_DEFAULT := nostripping
    endif
  endif
endif

# Camera
TARGET_USES_AOSP := true
BOARD_QTI_CAMERA_32BIT_ONLY := true
USE_CAMERA_STUB := true
TARGET_USES_ION := true
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_CAMERA_STUB := true

# GPS
TARGET_NO_RPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

PRODUCT_VENDOR_MOVE_ENABLED := true

# wlan
TARGET_USES_ION := true
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_BUILT := qca_cld3
WIFI_DRIVER_DEFAULT := qca_cld3
WPA_SUPPLICANT_VERSION := VER_0_8_X
HOSTAPD_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HIDL_FEATURE_AWARE := true

# Audio
BOARD_USES_ALSA_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := 1
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_USB_TUNNEL := true
BOARD_ROOT_EXTRA_SYMLINKS := /vendor/lib/dsp:/dsp

# Graphics
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true

# Display
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_HAS_HDR_DISPLAY := false
TARGET_USES_COLOR_METADATA := true

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Vendor Interface Manifest
DEVICE_MANIFEST_FILE := device/essential/mata/manifest.xml
DEVICE_MATRIX_FILE := device/essential/mata/compatibility_matrix.xml

BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

BOARD_VNDK_VERSION := current

BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

USE_DEVICE_SPECIFIC_IPACFG_MGR := true
