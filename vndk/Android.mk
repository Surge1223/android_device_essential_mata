ifneq ($(filter mata, aosp_mata $(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

VNDK_SP_LIBRARIES := \
    android.hardware.graphics.common@1.0 \
    android.hardware.graphics.common@1.1 \
    android.hardware.graphics.mapper@2.0 \
    android.hardware.graphics.mapper@2.1 \
    android.hardware.renderscript@1.0 \
    android.hidl.memory.token@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory@1.0-impl \
    libRSCpuRef \
    libRSDriver \
    libRS_internal \
    libbacktrace \
    libbase \
    libbcinfo \
    libblas \
    libc++ \
    libcompiler_rt \
    libcutils \
    libhardware \
    libhidlbase \
    libhidlmemory \
    libhidltransport \
    libhwbinder \
    libhwbinder_noltopgo \
    libion \
    liblzma \
    libunwind \
    libunwindstack \
    libutils \
    libutilscallstack \
    libz

VNDK_SP_EXT_LIBRARIES := \

EXTRA_VENDOR_LIBRARIES := \
    android.hardware.audio.common-util \
    android.hardware.audio.common@2.0 \
    android.hardware.audio.common@2.0-util \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.effect@2.0 \
    android.hardware.audio.effect@4.0 \
    android.hardware.audio@2.0 \
    android.hardware.audio@4.0 \
    android.hardware.bluetooth.a2dp@1.0 \
    android.hardware.bluetooth@1.0 \
    android.hardware.boot@1.0 \
    android.hardware.camera.common@1.0 \
    android.hardware.camera.device@1.0 \
    android.hardware.camera.device@3.2 \
    android.hardware.camera.device@3.3 \
    android.hardware.camera.device@3.4 \
    android.hardware.camera.provider@2.4 \
    android.hardware.cas.native@1.0 \
    android.hardware.cas@1.0 \
    android.hardware.configstore-utils \
    android.hardware.configstore@1.0 \
    android.hardware.configstore@1.1 \
    android.hardware.drm@1.0 \
    android.hardware.gatekeeper@1.0 \
    android.hardware.gnss@1.0 \
    android.hardware.graphics.allocator@2.0 \
    android.hardware.graphics.bufferqueue@1.0 \
    android.hardware.graphics.composer@2.1 \
    android.hardware.health@1.0 \
    android.hardware.keymaster@3.0 \
    android.hardware.media.omx@1.0 \
    android.hardware.media@1.0 \
    android.hardware.memtrack@1.0 \
    android.hardware.nfc@1.0 \
    android.hardware.power@1.0 \
    android.hardware.power@1.1 \
    android.hardware.power@1.2 \
    android.hardware.radio.deprecated@1.0 \
    android.hardware.radio@1.0 \
    android.hardware.radio@1.1 \
    android.hardware.sensors@1.0 \
    android.hardware.soundtrigger@2.0 \
    android.hardware.soundtrigger@2.0-core \
    android.hardware.soundtrigger@2.1 \
    android.hardware.thermal@1.0 \
    android.hardware.usb@1.0 \
    android.hardware.vibrator@1.0 \
    android.hardware.vibrator@1.1 \
    android.hardware.wifi.hostapd@1.0 \
    android.hardware.wifi.offload@1.0 \
    android.hardware.wifi.supplicant@1.0 \
    android.hardware.wifi.supplicant@1.1 \
    android.hardware.wifi@1.0 \
    android.hardware.wifi@1.1 \
    android.hardware.wifi@1.2 \
    android.hidl.allocator@1.0 \
    android.hidl.token@1.0 \
    android.hidl.token@1.0-utils \
    android.system.wifi.keystore@1.0 \
    libaudioroute \
    libaudioutils \
    libbinder \
    libcamera_metadata \
    libcap \
    libcrypto \
    libexif \
    libexpat \
    libfmq \
    libgui \
    libhardware_legacy \
    libjpeg \
    libkeymaster_messages \
    libkeymaster_portable \
    libmedia_omx \
    libminijail \
    libnetutils \
    libnl \
    libpcre2 \
    libprotobuf-cpp-full \
    libprotobuf-cpp-lite \
    libpuresoftkeymasterdevice \
    libselinux \
    libsoftkeymasterdevice \
    libspeexresampler \
    libssl \
    libstagefright_bufferqueue_helper \
    libstagefright_foundation \
    libstagefright_omx \
    libstagefright_omx_utils \
    libstagefright_xmlparser \
    libtinyalsa \
    libtinyxml2 \
    libui \
    libwifi-system-iface \
    libxml2 \
    libyuv


define add-vndk-sp-lib
include $$(CLEAR_VARS)
LOCAL_MODULE := $1.vndk-sp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PREBUILT_MODULE_FILE := $$(TARGET_OUT)/lib/$1.so
LOCAL_MULTILIB := 32
LOCAL_MODULE_TAGS := optional
LOCAL_INSTALLED_MODULE_STEM := $1.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_RELATIVE_PATH := vndk-sp
include $$(BUILD_PREBUILT)

include $$(CLEAR_VARS)
LOCAL_MODULE := $1.vndk-sp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PREBUILT_MODULE_FILE := $$(TARGET_OUT)/lib64/$1.so
LOCAL_MULTILIB := 64
LOCAL_MODULE_TAGS := optional
LOCAL_INSTALLED_MODULE_STEM := $1.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_RELATIVE_PATH := vndk-sp
include $$(BUILD_PREBUILT)
endef

define define-vndk-lib

include $$(CLEAR_VARS)
LOCAL_MODULE := $1.$2
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
\LOCAL_STRIP_MODULE := false
LOCAL_PREBUILT_MODULE_FILE := $$(TARGET_OUT)/lib/$1.so
LOCAL_MULTILIB := 32
LOCAL_MODULE_TAGS := optional
LOCAL_INSTALLED_MODULE_STEM := $1.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_RELATIVE_PATH := $3
LOCAL_VENDOR_MODULE := $4
include $$(BUILD_PREBUILT)

include $$(CLEAR_VARS)
LOCAL_MODULE := $1.$2
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_PREBUILT_MODULE_FILE := $$(TARGET_OUT)/lib64/$1.so
LOCAL_MULTILIB := 64
LOCAL_MODULE_TAGS := optional
LOCAL_INSTALLED_MODULE_STEM := $1.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_RELATIVE_PATH := $3
LOCAL_VENDOR_MODULE := $4
include $$(BUILD_PREBUILT)
endef

$(foreach lib,$(VNDK_SP_LIBRARIES),\
        $(eval $(call add-vndk-sp-lib,$(lib))))
$(foreach lib,$(EXTRA_VENDOR_LIBRARIES),\
    $(eval $(call define-vndk-lib,$(lib),vndk-ext-gen,,true)))

include $(CLEAR_VARS)
LOCAL_MODULE := mata-vndk
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := \
    $(addsuffix .vndk-sp-gen,$(VNDK_SP_LIBRARIES)) \
    $(addsuffix .vndk-ext-gen,$(EXTRA_VENDOR_LIBRARIES))
include $(BUILD_PHONY_PACKAGE)

endif # if TARGET_DEVICE is mata or aosp_mata
