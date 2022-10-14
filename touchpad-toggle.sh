#! /usr/bin/bash

# use 'xinput' to find your touchpad name
DEVICE_NAME="ELAN0000:00 04F3:3138 Touchpad"

# find touchpad id
TOUCHPAD_ID=$(xinput list --id-only "$DEVICE_NAME")

# read ini file
FILE_PATH="settings.ini"

if [ -f "$FILE_PATH" ]; then
    VALUE=$(cat "$FILE_PATH")
else 
    VALUE=0
    touch "$FILE_PATH"
fi

# flips value
(( VALUE = !VALUE ))

# toggles touchpad
xinput set-prop "$TOUCHPAD_ID" "Device Enabled" "$VALUE"

# updates settings.ini file
echo "$VALUE" > "$FILE_PATH"