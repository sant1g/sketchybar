#!/bin/bash

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
AC_CONNECTED=$(pmset -g batt | grep 'AC Power')
CHARGING=$(pmset -g batt | grep 'not charging present: true')

if [ "$PERCENTAGE" = "" ]; then
  exit 0
else
  LABEL="--%"
  if [ "$AC_CONNECTED" = "" ]; then
    LABEL="${PERCENTAGE}%"
  else
    if [ "$CHARGING" = "" ]; then
      LABEL="󰤅"
    else
      LABEL="${PERCENTAGE}%󱐋"
    fi
  fi

  sketchybar --set "$NAME" label="$LABEL"
fi
