#!/bin/bash

if [ "$INFO" == "" ]; then
  LEVEL=$(osascript -e 'set ovol to output volume of (get volume settings)')
else
  LEVEL=$INFO
fi

if [ 20 -gt "$LEVEL" ] && [ "$LEVEL" -ne 0 ]; then
  LEVEL=20
fi

sketchybar --animate circ 30 --set "$NAME" slider.percentage="$LEVEL"
