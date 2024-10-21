#!/usr/bin/env bash

set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <left|right>"
    echo "Will flash the given side of the keyboard"
    exit 1
fi

UUID=0042-0042
case $1 in
left)
    FILENAME="corne_left nice_view_adapter nice_view_gem-nice_nano_v2-zmk.uf2"
    # FILENAME="settings_reset-nice_nano_v2-zmk.uf2"
    ;;
right)
    FILENAME="corne_right nice_view_adapter nice_view_gem-nice_nano_v2-zmk.uf2"
    # FILENAME="settings_reset-nice_nano_v2-zmk.uf2"
    ;;
*)
    # Handle unexpected arguments
    echo "Invalid argument: $1. Please use 'left' or 'right'."
    exit 2
    ;;
esac

echo "unzipping firmware"
unzip $HOME/Downloads/firmware.zip -d /tmp/firmware

sudo mount UUID=$UUID /media/keyboard

sudo cp /tmp/firmware/"$FILENAME" /media/keyboard/

rm -rf /tmp/firmware
