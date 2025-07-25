#!/bin/bash

MODES=("VOL" "SCR" "MOV" "MED")

if [ "$INDEX" -eq 0 ]; then
  sketchybar --set encoders icon="< ${MODES[$MODE]}"
elif [ "$INDEX" -eq 1 ]; then
  sketchybar --set encoders label="${MODES[$MODE]} >"
fi
