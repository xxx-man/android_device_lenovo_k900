# Get the long list of APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

$(call inherit-product, build/target/product/full_base_telephony.mk)

$(call inherit-product, device/lenovo/k900/device.mk)

PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_NAME := k900
PRODUCT_DEVICE := k900
PRODUCT_BRAND := K900_Intel
PRODUCT_MODEL := LENOVO-K900
PRODUCT_MANUFACTURER := lenovo