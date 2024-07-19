# Battery Saving and Performance Optimization Tool

![Battery Saving and Performance Optimization Tool](https://github.com/thelordalex/AlexDark-performance/blob/main/AlexDark-performance.jpg)

## Overview

This tool consists of two shell scripts designed to optimize and revert system settings on Android devices for better battery life, reduced heat, and improved internet speed.

### Script 1: Optimization Script

The optimization script applies various settings to enhance battery performance and reduce heat. Here are the key functionalities:

- **Change CPU Governor**: Sets the CPU governor to "powersave" to reduce power consumption.
- **Limit CPU Frequency**: Caps the maximum CPU frequency to a lower value (e.g., 800 MHz) to reduce heat and save battery.
- **Disable Unused Hardware Components**: Turns off Wi-Fi, Bluetooth, and GPS when not in use to save power.
- **Reduce Screen Brightness**: Lowers the screen brightness to a specified level (e.g., 20) to save battery.
- **Enable Battery Saver Mode**: Activates the device's battery saver mode to reduce background activity and extend battery life.
- **Clear Cache**: Clears system cache to free up memory and improve performance.
- **Manage Background Processes**: Kills unnecessary background processes to free up system resources.
- **Tweak TCP Settings**: Adjusts TCP settings to optimize internet speed.
- **Disable Animations**: Turns off system animations to improve performance and save battery.
- **Reduce Logging**: Reduces system logging to improve performance.

### Script 2: Reversion Script

The reversion script restores the original settings to bring the device back to its normal operational state. Key functionalities include:

- **Change CPU Governor**: Resets the CPU governor back to "interactive" for balanced performance.
- **Reset CPU Frequency**: Restores the maximum CPU frequency to its default value (e.g., 1400 MHz).
- **Enable Hardware Components**: Turns Wi-Fi, Bluetooth, and GPS back on.
- **Reset Screen Brightness**: Restores screen brightness to its default level (e.g., 100).
- **Disable Battery Saver Mode**: Deactivates the battery saver mode.
- **Restore TCP Settings**: Reverts TCP settings to their default values.
- **Enable Animations**: Turns system animations back on.
- **Reset Logging**: Restores system logging to its default settings.

## Usage

### Prerequisites

- Rooted Android device.
- Terminal emulator or ADB access.

### Running the Scripts

1. **Optimization Script**: This script is designed to enhance your device’s performance and save battery. Save the script as `optimize.sh` and run it using the following command:

    ```sh
    sh optimize.sh
    ```

2. **Reversion Script**: This script reverts all changes made by the optimization script. Save the script as `revert.sh` and run it using the following command:

    ```sh
    sh revert.sh
    ```

## Author

- **Name**: AlexDark-performance
- **Instagram**: [ussefayman_](https://www.instagram.com/ussefayman_)
- **Telegram**: [@uusergram](https://t.me/uusergram)

These scripts are designed to provide an easy and efficient way to manage your device’s performance and battery life. Feel free to reach out on Instagram or Telegram if you have any questions or feedback!
