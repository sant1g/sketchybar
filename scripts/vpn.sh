#!/bin/bash

. colors.sh

STATUS="$(osascript -e "tell application \"Tunnelblick\" to get state of first configuration where name = \"sgomez\"")"

if [ "$STATUS" = "CONNECTED" ]; then
  sketchybar --animate circ 30 --set "$NAME" label="ON" label.color=$FG icon.color=$FG background.image='./resources/bg_small_accent.png'
else
  sketchybar --animate circ 30 --set "$NAME" label="OFF" label.color=$BG icon.color=$BG background.image='./resources/bg_small_white.png'
fi
