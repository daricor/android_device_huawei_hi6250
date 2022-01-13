#
# Copyright 2020 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)

#include $(CLEAR_VARS)

#LOCAL_SHARED_LIBRARIES := libcopybit_wrapper liblog libcutils libc
#LOCAL_SRC_FILES := main.cpp
#LOCAL_MODULE := copybittest
#LOCAL_CFLAGS:= -DLOG_TAG=\"copybit_wrapper\"
#include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_SRC_FILES := copybit.cpp copybit_interface.cpp dump.cpp
LOCAL_MODULE := libcopybit_wrapper
LOCAL_CFLAGS:= -DLOG_TAG='"Meticulus Copybit Wrapper"'

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
LOCAL_CFLAGS += -DDEBUG
endif

# Install the symlinks.
LOCAL_POST_INSTALL_CMD := mkdir -p $(TARGET_OUT)/lib64/hw; ln -sf ../libcopybit_wrapper.so $(TARGET_OUT)/lib64/hw/copybit.hi6250.so;

include $(BUILD_SHARED_LIBRARY)
