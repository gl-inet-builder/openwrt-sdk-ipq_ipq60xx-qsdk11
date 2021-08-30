#!/bin/sh
#
# Copyright (c) 2019, The Linux Foundation. All rights reserved.
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

perf_setup(){

	if [ -d "/sys/kernel/debug/ath11k" ]; then

		#read the "/etc/config/wireless" file to check whether nss is enabled or not if not then set 0
		config_get enable_nss mac80211 enable_nss 0

		if [ "$enable_nss" -eq 0 ]; then
			/etc/init.d/qca-nss-ecm stop
		fi

		#set the scaling_governor for all core
		[ -d "/sys/devices/system/cpu/cpu0" ] && echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
		[ -d "/sys/devices/system/cpu/cpu1" ] && echo "performance" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
		[ -d "/sys/devices/system/cpu/cpu2" ] && echo "performance" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
		[ -d "/sys/devices/system/cpu/cpu3" ] && echo "performance" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor

		#check for number of ethernet available
		[ -d "/sys/class/net/eth0" ] && echo f > /sys/class/net/eth0/queues/rx-0/rps_cpus
		[ -d "/sys/class/net/eth1" ] && echo f > /sys/class/net/eth1/queues/rx-0/rps_cpus
		[ -d "/sys/class/net/eth2" ] && echo f > /sys/class/net/eth2/queues/rx-0/rps_cpus
		[ -d "/sys/class/net/eth3" ] && echo f > /sys/class/net/eth3/queues/rx-0/rps_cpus
		[ -d "/sys/class/net/eth4" ] && echo f > /sys/class/net/eth4/queues/rx-0/rps_cpus
		[ -d "/sys/class/net/eth5" ] && echo f > /sys/class/net/eth5/queues/rx-0/rps_cpus

		#check for number of radio available
		[ -d "/sys/class/net/wlan0" ] && echo e > /sys/class/net/wlan0/queues/rx-0/rps_cpus
		[ -d "/sys/class/net/wlan1" ] && echo e > /sys/class/net/wlan1/queues/rx-0/rps_cpus
		[ -d "/sys/class/net/wlan2" ] && echo e > /sys/class/net/wlan2/queues/rx-0/rps_cpus
	fi
}

perf_setup
