include $(GENERIC_X86_CONFIG_MK)

LOCAL_PATH := device/lenovo/k900

#Board configuration
TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86
TARGET_CPU_ABI := x86
TARGET_CPU_VARIANT := x86
TARGET_ARCH_VARIANT_FPU := sse
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_SMP := true
TARGET_PRELINK_MODULE := false

#Intel
INTEL_INGREDIENTS_VERSIONS := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
LOCAL_CFLAGS += -DARCH_IA32

# Security
BUILD_WITH_WATCHDOG_DAEMON_SUPPORT := true

# Make settings
TARGET_RECOVERY_KERNEL := $(LOCAL_PATH)/recovery/kernel
#TARGET_NO_KERNEL := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Enabling Houdini by default
INTEL_HOUDINI := true
ifdef ($(INTEL_HOUDINI))
ADDITIONAL_BUILD_PROPERTIES += ro.product.cpu.abi2=armeabi-v7a
ADDITIONAL_BUILD_PROPERTIES += ro.product.cpu.upgradeabi=armeabi-v7a
ADDITIONAL_BUILD_PROPERTIES += dalvik.vm.houdini=on
endif

# Use boot tools to make Intel-formatted images
DEVICE_BASE_BOOT_IMAGE := $(LOCAL_PATH)/recovery/boot.img
DEVICE_BASE_RECOVERY_IMAGE := $(LOCAL_PATH)/recovery/recovery.img
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/intel-boot-tools/boot.mk

#Atom optimizations to improve memory benchmarks
-include $(LOCAL_PATH)/OptAtom.mk

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 21

#HW_Rendering
BOARD_USES_HWCOMPOSER := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/recovery/egl.cfg
BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_ALLOW_EGL_HIBERNATION := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH
USE_INTEL_MDP := true
TARGET_NO_METADATA_ON_AVC_ENC := true
INTEL_VA := true
ENABLE_IMG_GRAPHICS := true
BOARD_USES_MRST_OMX := true
USE_INTEL_SECURE_AVC := true

####################################################################

# Mount points
BOARD_DATA_DEVICE := /dev/block/mmcblk0p9
BOARD_DATA_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p6
BOARD_CACHE_FILESYSTEM := ext4
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p8
BOARD_SYSTEM_FILESYSTEM := ext4

# Recovery config global
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
DEVICE_RESOLUTION := 1080x1920
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/ramdisk/recovery.fstab
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/ramdisk/init.rc
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true

# TWRP recovery config
TW_INCLUDE_INJECTTWRP := false
TWRP_EVENT_LOGGING := false
TW_INTERNAL_STORAGE_PATH := "/usbotg"
TW_INTERNAL_STORAGE_MOUNT_POINT := "usbotg"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TWHAVE_SELINUX := false
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/class/backlight/psb-bl/brightness
