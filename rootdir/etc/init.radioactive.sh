#!/system/bin/sh 

sleep 50;

#
# This file was originaly init.renderzenit.sh renamed and Modified by acuicultor for Radioactive kernel  
# All credits to RenderBroken and Joshuos
# Applying RenderZenith Settings modified for Radioactive kernel
#

# Change Selinux status as per user desire
#   setenforce 0

# Set backlight min value as per user desire
#    echo 0 > /sys/module/msm_drm/parameters/backlight_min 

# Enable fast charge as per user desire
    echo 0 > /sys/kernel/fast_charge/force_fast_charge

# Enable OTG by default
    echo 0 > /sys/class/power_supply/usb/otg_switch

# Setup Schedutil Governor
	echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	echo 500 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us
	echo 20000 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
	echo 1 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/iowait_boost_enable
	echo 0 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/pl
	echo 0 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_freq

	echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor	
	echo 500 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/up_rate_limit_us
	echo 20000 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/down_rate_limit_us
	echo 1 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/iowait_boost_enable
	echo 0 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/pl
	echo 0 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_freq

# Input boost and stune configuration
	echo "0:1056000 1:0 2:0 3:0 4:1056000 5:0 6:0 7:0" > /sys/module/cpu_boost/parameters/input_boost_freq
	echo 500 > /sys/module/cpu_boost/parameters/input_boost_ms
	echo 20 > /sys/module/cpu_boost/parameters/dynamic_stune_boost
    echo 1500 > /sys/module/cpu_boost/parameters/dynamic_stune_boost_ms

# Dynamic Stune Boost during sched_boost
	echo 20 > /dev/stune/top-app/schedtune.sched_boost 

# Set default schedTune value for foreground/top-app
	echo 0 > /dev/stune/top-app/schedtune.boost 
 
# Disable sched_boost
	echo 0 > /proc/sys/kernel/sched_boost   

# Disable CAF task placement for Big Cores
	echo 0 > /proc/sys/kernel/sched_walt_rotate_big_tasks

# Tune Core_CTL for proper task placement
	echo 0 > /sys/devices/system/cpu/cpu0/core_ctl/enable 
	echo 0 > /sys/devices/system/cpu/cpu4/core_ctl/enable 

# Disable sched autogroup
    echo 0 > /proc/sys/kernel/sched_autogroup_enabled 

# Setup EAS cpusets values for better load balancing
	echo 0-7 > /dev/cpuset/top-app/cpus
	echo 0-3,6-7 > /dev/cpuset/foreground/cpus
	echo 0-1 > /dev/cpuset/background/cpus
	echo 0-3  > /dev/cpuset/system-background/cpus
	echo 0-3 > /dev/cpuset/restricted/cpus

# Adjust Read Ahead
	echo 128 > /sys/block/sda/queue/read_ahead_kb
	echo 128 > /sys/block/dm-0/queue/read_ahead_kb

# Virtual Memory tweak
     echo 60 > /proc/sys/vm/swappiness
     echo 10 > /proc/sys/vm/dirty_background_ratio
     echo 3000 > /proc/sys/vm/dirty_writeback_centisecs
     echo 60 > /proc/sys/vm/vfs_cache_pressure

# Setup ZRAM
	echo 8 > /sys/block/zram0/max_comp_streams
	echo 1073741824 > /sys/block/zram0/disksize

# Disable exception-trace
    echo 0 > /proc/sys/debug/exception-trace

# Disable printk log spamming to the console;
    echo "0 0 0 0" > /proc/sys/kernel/printk

# Network tweak
    echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control

Disable sched autogroup
    echo 0 > /proc/sys/kernel/sched_autogroup_enabled 

# Setup EAS cpusets values for better load balancing
	echo 0-7 > /dev/cpuset/top-app/cpus
	echo 0-3,6-7 > /dev/cpuset/foreground/cpus
	echo 0-1 > /dev/cpuset/background/cpus
	echo 0-3  > /dev/cpuset/system-background/cpus
	echo 0-3 > /dev/cpuset/restricted/cpus

# Adjust Read Ahead
	echo 128 > /sys/block/sda/queue/read_ahead_kb
	echo 128 > /sys/block/dm-0/queue/read_ahead_kb

# Virtual Memory tweak
     echo 60 > /proc/sys/vm/swappiness
     echo 10 > /proc/sys/vm/dirty_background_ratio
     echo 3000 > /proc/sys/vm/dirty_writeback_centisecs
     echo 60 > /proc/sys/vm/vfs_cache_pressure

# Setup ZRAM
	echo
