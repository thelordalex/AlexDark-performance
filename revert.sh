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
# Description: This script is designed to revert battery saving, heat reduction, and internet speed optimization changes on Android devices.

# Function to change CPU governor back to "interactive"
change_cpu_governor() {
    echo "Changing CPU governor to 'interactive'..."
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
        echo "interactive" > $cpu
    done
}

# Function to reset max CPU frequency to default
reset_cpu_frequency() {
    echo "Resetting max CPU frequency to default..."
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq; do
        echo "1400000" > $cpu  # Reset to default frequency (adjust as needed)
    done
}

# Function to turn on hardware components
turn_on_hardware() {
    echo "Turning on hardware components..."
    # Turn on Wi-Fi
    svc wifi enable
    # Turn on Bluetooth
    svc bluetooth enable
    # Turn on GPS
    settings put secure location_mode 3
}

# Function to reset screen brightness
reset_screen_brightness() {
    echo "Resetting screen brightness..."
    settings put system screen_brightness 100  # Set brightness to default (adjust as needed)
}

# Function to disable battery saver mode
disable_battery_saver() {
    echo "Disabling battery saver mode..."
    dumpsys deviceidle unforce
}

# Function to restore default TCP settings
restore_tcp_settings() {
    echo "Restoring default TCP settings..."
    echo "0" > /proc/sys/net/ipv4/tcp_tw_recycle
    echo "0" > /proc/sys/net/ipv4/tcp_tw_reuse
    echo "1" > /proc/sys/net/ipv4/tcp_slow_start_after_idle
    echo "0" > /proc/sys/net/ipv4/tcp_window_scaling
}

# Function to enable animations
enable_animations() {
    echo "Enabling system animations..."
    settings put global window_animation_scale 1
    settings put global transition_animation_scale 1
    settings put global animator_duration_scale 1
}

# Function to reset logging to default
reset_logging() {
    echo "Resetting logging to default..."
    setprop log.tag.VibeService INFO
    setprop log.tag.AudioPolicyService INFO
    setprop log.tag.AudioFlinger INFO
}

# Execute functions
change_cpu_governor
reset_cpu_frequency
turn_on_hardware
reset_screen_brightness
disable_battery_saver
restore_tcp_settings
enable_animations
reset_logging

echo "Revert script executed successfully."