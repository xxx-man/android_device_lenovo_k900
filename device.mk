LOCAL_PATH := device/lenovo/k900

#During Development we will turn off all security etc.
ADDITIONAL_DEFAULT_PROPERTIES := \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debugabble=1 

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/recovery/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Enable it if you have glitches on 2D rendering
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bq.gpu_to_cpu_unsupported=1

# SGX540 is slower with the scissor optimization enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true
	
# Don't preload EGL drivers in Zygote at boot time
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true

# Houdini
PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,$(LOCAL_PATH)/houdini/system,system)

PRODUCT_PACKAGES += \
   libhoudini_hook \
   houdini_hook

# Recovery proprietary files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/charger:recovery/root/charger \
	$(LOCAL_PATH)/ramdisk/file_contexts:recovery/root/file_contexts \
	$(LOCAL_PATH)/ramdisk/fstab.charger.redhookbay:recovery/root/fstab.charger.redhookbay \
	$(LOCAL_PATH)/ramdisk/fstab.redhookbay:recovery/root/fstab.redhookbay \
	$(LOCAL_PATH)/ramdisk/props.default.rc:recovery/root/props.default.rc \
	$(LOCAL_PATH)/ramdisk/props.platform.rc:recovery/root/props.platform.rc \
	$(LOCAL_PATH)/ramdisk/props.rc:recovery/root/props.rc \
	$(LOCAL_PATH)/ramdisk/recovery.init.redhookbay.rc:recovery/root/recovery.init.redhookbay.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.goldfish.rc:recovery/root/ueventd.goldfish.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.rc:recovery/root/ueventd.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.redhookbay.rc:recovery/root/ueventd.redhookbay.rc

# Recovery enire folder copy (test only for now)
#PRODUCT_COPY_FILES += \
#	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/ramdisk/etc,recovery/root/etc) \
#	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/ramdisk/sbin,recovery/root/sbin) \
#	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/ramdisk,recovery/root)

# Inherit dalvik configuration and the rest of the platform
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
