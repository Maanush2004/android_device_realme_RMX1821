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

# Permissions
PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml
	
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
	$(LOCAL_PATH)/overlay \
	$(LOCAL_PATH)/overlay-lineage

# Dependency of kpoc_charger
PRODUCT_PACKAGES += \
    libsuspend

# Input Configs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/input/idc/AVRCP.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/AVRCP.idc \
	$(LOCAL_PATH)/input/keylayout/ACCDET.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/ACCDET.kl \
	$(LOCAL_PATH)/input/keylayout/AVRCP.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/AVRCP.kl \
	$(LOCAL_PATH)/input/keylayout/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl
	
# Fingerprint
PRODUCT_PACKAGES += \
	android.hardware.biometrics.fingerprint@2.1-service.oppo.compat \
	
# Call proprietary blob setup
$(call inherit-product-if-exists, vendor/realme/RMX1821/RMX1821-vendor.mk)
