#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
endif

# Signing
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey
PRODUCT_EXTRA_RECOVERY_KEYS := vendor/certs/releasekey

#ifeq ($(filter lineage_ether,$(PRODUCT_NAME)),)
#PRODUCT_PACKAGES += \
#    init.jav.usb.rc
#endif

# Huawei stuff
#ifeq ($(filter lineage_berkeley,$(PRODUCT_NAME)),)
#PRODUCT_PACKAGES += \
#    HotwordEnrollmentOKGoogleHI6403 \
#    HotwordEnrollmentXGoogleHI6403
#endif

# Volume Steps
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25

# Recovery ADB keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys
