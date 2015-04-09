LOCAL_PATH := device/lenovo/k900

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlays

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

# Recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/recovery.fstab:recovery/root/etc/recovery.fstab
	$(LOCAL_PATH)/recovery/charger:recovery/root/charger
	$(LOCAL_PATH)/recovery/file_contexts:recovery/root/file_contexts
	$(LOCAL_PATH)/recovery/fstab.charger.redhookbay:recovery/root/fstab.charger.redhookbay
	$(LOCAL_PATH)/recovery/fstab.redhookbay:recovery/root/fstab.redhookbay

# Inherit dalvik configuration and the rest of the platform
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
