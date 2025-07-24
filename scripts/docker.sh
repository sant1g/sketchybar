#!/bin/bash

. colors.sh

/usr/local/bin/docker info > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
  sketchybar --animate circ 30 --set "$NAME" label="OFF" label.color=$BG icon.color=$BG background.image='./resources/bg_small_white.png'
else
  sketchybar --animate circ 30 --set "$NAME" label="ON" label.color=$FG icon.color=$FG background.image='./resources/bg_small_accent.png'
fi
