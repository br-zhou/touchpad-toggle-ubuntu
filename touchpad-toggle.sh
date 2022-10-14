#! /usr/bin/bash

# find id using 'xinput' command
TOUCHPAD_ID=14

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