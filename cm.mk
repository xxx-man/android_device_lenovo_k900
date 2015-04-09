## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

## Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
 
## Inherit device configuration
$(call inherit-product, device/lenovo/redhookbay/full_redhookbay.mk)

## Device identifier. This must come after all inclusions
PRODUCT_RELEASE_NAME := k900
PRODUCT_DEVICE := k900
PRODUCT_NAME := cm_k900
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := k900
PRODUCT_MANUFACTURER := Lenovo
