#!/bin/sh

echo "
░█████╗░██╗░░░░░███████╗██╗░░██╗
██╔══██╗██║░░░░░██╔════╝╚██╗██╔╝
███████║██║░░░░░█████╗░░░╚███╔╝░
██╔══██║██║░░░░░██╔══╝░░░██╔██╗░
██║░░██║███████╗███████╗██╔╝╚██╗
╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░╚═╝

░██████╗░█████╗░██████╗░██╗██████╗░████████╗
██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝
╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░
░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░
██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░
╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░

██████╗░██╗░░░██╗███╗░░██╗
██╔══██╗██║░░░██║████╗░██║
██████╔╝██║░░░██║██╔██╗██║
██╔══██╗██║░░░██║██║╚████║
██║░░██║╚██████╔╝██║░╚███║
╚═╝░░╚═╝░╚═════╝░╚═╝░░╚══╝

░█████╗░██████╗░████████╗██╗███╗░░░███╗██╗███████╗
██╔══██╗██╔══██╗╚══██╔══╝██║████╗░████║██║╚════██║
██║░░██║██████╔╝░░░██║░░░██║██╔████╔██║██║░░███╔═╝
██║░░██║██╔═══╝░░░░██║░░░██║██║╚██╔╝██║██║██╔══╝░░
╚█████╔╝██║░░░░░░░░██║░░░██║██║░╚═╝░██║██║███████╗
░╚════╝░╚═╝░░░░░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝╚═╝╚══════╝ "

# Author: AlexDark-performance
# Instagram: ussefayman_
# Telegram: @uusergram
# Description: This script is designed to save battery, reduce heat, and optimize internet speed on Android devices.

# Function to change CPU governor to "powersave"
change_cpu_governor() {
    echo "Changing CPU governor to 'powersave'..."
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
        echo "powersave" > $cpu
    done
}

# Function to limit max CPU frequency
limit_cpu_frequency() {
    echo "Limiting max CPU frequency..."
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq; do
        echo "800000" > $cpu  # Limiting to 800 MHz (adjust as needed)
    done
}

# Function to turn off unused hardware components
turn_off_unused_hardware() {
    echo "Turning off unused hardware components..."
    # Turn off Wi-Fi
    svc wifi disable
    # Turn off Bluetooth
    svc bluetooth disable
    # Turn off GPS
    settings put secure location_mode 0
}

# Function to reduce screen brightness
reduce_screen_brightness() {
    echo "Reducing screen brightness..."
    settings put system screen_brightness 20  # Set brightness to 20 (adjust as needed)
}

# Function to enable battery saver mode
enable_battery_saver() {
    echo "Enabling battery saver mode..."
    dumpsys deviceidle force-idle
}

# Function to clear cache
clear_cache() {
    echo "Clearing cache..."
    sync; echo 3 > /proc/sys/vm/drop_caches
}

# Function to manage background processes
manage_background_processes() {
    echo "Killing background processes..."
    for app in $(ps -A | grep -v "system" | grep -v "root" | awk '{print $9}'); do
        am force-stop $app
    done
}

# Function to tweak TCP settings for better internet speed
tweak_tcp_settings() {
    echo "Tweaking TCP settings for better internet speed..."
    echo "1" > /proc/sys/net/ipv4/tcp_tw_recycle
    echo "1" > /proc/sys/net/ipv4/tcp_tw_reuse
    echo "0" > /proc/sys/net/ipv4/tcp_slow_start_after_idle
    echo "1" > /proc/sys/net/ipv4/tcp_window_scaling
}

# Function to disable animations
disable_animations() {
    echo "Disabling system animations..."
    settings put global window_animation_scale 0
    settings put global transition_animation_scale 0
    settings put global animator_duration_scale 0
}

# Function to reduce logging for better performance
reduce_logging() {
    echo "Reducing logging for better performance..."
    setprop log.tag.VibeService DEBUG
    setprop log.tag.AudioPolicyService INFO
    setprop log.tag.AudioFlinger INFO
}

# Execute functions
change_cpu_governor
limit_cpu_frequency
turn_off_unused_hardware
reduce_screen_brightness
enable_battery_saver
clear_cache
manage_background_processes
tweak_tcp_settings
disable_animations
reduce_logging

echo "Battery saving, thermal management, and internet speed optimization script executed successfully."