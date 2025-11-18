#!/usr/bin/env bash

TARGET_MAC="6C:21:A2:75:A9:23"
CUSTOM_ALIAS=" Yandex Station"

# Get volume (0–100)
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')

# Detect connected device
CONNECTED=$(bluetoothctl info | grep "Device " | awk '{print $2}')

if [ -z "$CONNECTED" ]; then
    # No BT device connected → show volume only
    echo "{\"text\": \"  ${VOLUME}%\", \"tooltip\": \"Volume: ${VOLUME}%\", \"class\": \"no-bt\"}"
    exit 0
fi

MAC="$CONNECTED"

# Get real alias
ALIAS=$(bluetoothctl info "$MAC" | grep "Alias:" | sed 's/.*Alias: //')

# Replace alias only if it's your device
if [ "$MAC" = "$TARGET_MAC" ]; then
    DISPLAY_ALIAS="$CUSTOM_ALIAS"
else
    DISPLAY_ALIAS="$ALIAS"
fi

# Show volume + alias
echo "{\"text\": \"  ${VOLUME}% $DISPLAY_ALIAS\", \"tooltip\": \"Connected: $ALIAS\", \"class\": \"connected\"}"

