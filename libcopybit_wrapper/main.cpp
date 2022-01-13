/*
 * Copyright (C) 2020 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <utils/Log.h>
#include <hardware/hardware.h>

static hw_module_t *real_module;
static hw_device_t *real_device;
extern int load_real_copybit(char * path, hw_module_t **pHmi);
extern int open_real_copybit(hw_module_t *module, hw_device_t **real_device);
extern int close_real_copybit(hw_device_t *real_device);

int main(void) {
load_real_copybit("/system/lib64/hw/copybit.hi6250.so", &real_module);
if(!open_real_copybit(real_module,&real_device))
    ALOGI("Meticulus copybit open!");
if(!close_real_copybit(real_device))
    ALOGI("Meticulus copybit closed!");
return 0;
}
