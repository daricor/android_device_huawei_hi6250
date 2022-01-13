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

#include "vendor_init.h"
#include <errno.h>

/* init vendor override stubs */

__attribute__ ((weak))
void vendor_load_properties()
{
}

__attribute__ ((weak))
int vendor_handle_control_message(const char *msg, const char *arg)
{
    return -ENOSYS;
}

int main(void) {
vendor_load_properties();
return 0;
}
