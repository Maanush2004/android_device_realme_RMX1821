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
	frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
	$(DEVICE_PATH)/configs/permissions/com.mediatek.op.ims.common.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.mediatek.op.ims.common.xml \
	$(DEVICE_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml
	
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
	$(DEVICE_PATH)/overlay \
	$(DEVICE_PATH)/overlay-lineage

# Dependencies of kpoc_charger
PRODUCT_PACKAGES += \
    libsuspend \
    android.hardware.health@2.0

# Input Configs
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/input/idc/AVRCP.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/AVRCP.idc \
	$(DEVICE_PATH)/configs/input/keylayout/ACCDET.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/ACCDET.kl \
	$(DEVICE_PATH)/configs/input/keylayout/AVRCP.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/AVRCP.kl

# Audio Configs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
	
# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.RMX1821
	
# Init
PRODUCT_PACKAGES += \
    fstab.mt6771 \
    init.RMX1821.rc \
    init.safailnet.rc \
    init.oppo.fingerprints.rc \
    init.ago.rc \
    fstab.enableswap

# Doze
PRODUCT_PACKAGES += \
    RealmeParts

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.RMX1821

# RcsService
PRODUCT_PACKAGES += \
    RcsService

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 29

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder

# Tethering
PRODUCT_PACKAGES += \
    TetheringConfigOverlay

# Symbols
PRODUCT_PACKAGES += \
    libshim_showlogo

# Face Unlock
PRODUCT_PACKAGES += \
    FaceUnlockService

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=true

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# IMS
$(call inherit-product, vendor/mediatek/ims/mtk-ims.mk)

# EngineerMode
$(call inherit-product, vendor/mediatek/ims/mtk-engi.mk)

# Call proprietary blob setup
$(call inherit-product-if-exists, vendor/realme/RMX1821/RMX1821-vendor.mk)
