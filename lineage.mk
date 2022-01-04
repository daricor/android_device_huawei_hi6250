#
# Copyright 2020 The LineageOS Project
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

# Common
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/locales_full.mk)

# Device
$(call inherit-product, device/huawei/hi6250/device.mk)

# LineageOS
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Device identifier
PRODUCT_DEVICE := hi6250
PRODUCT_NAME := lineage_hi6250
PRODUCT_BRAND := huawei
PRODUCT_MODEL := hi6250
PRODUCT_MANUFACTURER := huawei
