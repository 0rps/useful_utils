#!/bin/bash

# Capture the output of the command
output=$(gsettings get org.gnome.desktop.input-sources sources)

OPTION_A="[('xkb', 'us'), ('xkb', 'ru')]"
OPTION_B="[('xkb', 'ru'), ('xkb', 'am+phonetic')]"
FINAL_OPTION="$OPTION_B"

# Check for the substring and decide which command to run
if [[ $output == *"'am+phonetic'"* ]]; then
    FINAL_OPTION="$OPTION_A"
fi

gsettings set org.gnome.desktop.input-sources sources "$FINAL_OPTION"
