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

#ifndef COMMON_H
#define COMMON_H

#define DDR_FREQ_MIN_PATH 	"/sys/class/devfreq/ddrfreq/min_freq"
#define DDR_FREQ_MAX_PATH 	"/sys/class/devfreq/ddrfreq/max_freq"
#define DDR_FREQ_POLL_PATH	"/sys/class/devfreq/ddrfreq/polling_interval"

#define GPU_FREQ_MIN_PATH 	"/sys/class/devfreq/gpufreq/min_freq"
#define GPU_FREQ_MAX_PATH 	"/sys/class/devfreq/gpufreq/max_freq"
#define GPU_FREQ_POLL_PATH 	"/sys/class/devfreq/gpufreq/polling_interval"
#define GPU_ANIM_BOOST_PATH	"/sys/class/devfreq/gpufreq/mali_ondemand/animation_boost"
#define GPU_ANIM_BOOST_F_PATH	"/sys/class/devfreq/gpufreq/mali_ondemand/animation_boost_freq"
#define GPU_HISPEED_F_PATH	"/sys/class/devfreq/gpufreq/mali_ondemand/hispeed_freq"
#define GPU_VSYNCUP_PATH	"/sys/class/devfreq/gpufreq/mali_ondemand/vsync_upthreshold"
#define GPU_NOVSYNCUP_PATH	"/sys/class/devfreq/gpufreq/mali_ondemand/no_vsync_upthreshold"

#define CPU0_BOOST_PULSE_PATH 	"/sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse"
#define CPU0_BOOST_P_DUR_PATH 	"/sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration"

#define CPU0_GOV_PATH	 	"/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
#define CPU0_FREQ_MIN_PATH 	"/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq"
#define CPU0_FREQ_MAX_PATH 	"/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq"

#define CPU4_GOV_PATH	 	"/sys/devices/system/cpu/cpu4/cpufreq/scaling_governor"
#define CPU4_FREQ_MIN_PATH	"/sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq"
#define CPU4_FREQ_MAX_PATH	"/sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq"


struct power_profile {
    const char * cpu0_freq_max;
    const char * cpu0_freq_low;
    const int    cpu0_boost_p_dur_def;
    const int    cpu0_should_boost;
    const char * cpu4_freq_max;
    const char * cpu4_freq_low;
    const char * gpu_freq_max;
    const char * gpu_freq_boost;
    const char * gpu_freq_low;
    const int    gpu_should_boost;
    const char * ddr_freq_max;
    const char * ddr_freq_boost;
    const char * ddr_freq_low;
    const int	 ddr_should_boost;
};

#endif
