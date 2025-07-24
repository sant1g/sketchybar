#!/bin/bash

. colors.sh

SPACE_LABELS=("WORK" "PERSONAL" "SLACK" "IDE" "TEXT" "TERM" "DATABASE" "CHAT" "MUSIC" "MISC")

if [ "$INFO" == "" ]; then
  for i in {0..9}
  do
    SID=$(($i+1))
    SPACE=space."$SID"

    WINDOWS_COUNT=$(yabai -m query --windows --space "$SID" | jq length)
    sketchybar --set $SPACE icon="${SPACE_LABELS[i]}"
    if [ "$WINDOWS_COUNT" -eq 0 ]; then
      sketchybar --set $SPACE icon.color="$GRAY2"
    else
      sketchybar --set $SPACE icon.color="$GRAY"
    fi
  done
else
  SID=$(echo "$INFO" | jq '.space')
  APPS=$(echo "$INFO" | jq '.apps')
  SPACE=space."$SID"
  if [ "$APPS" == "{}" ]; then
    sketchybar --set $SPACE icon.color="$GRAY2"
  else
    sketchybar --set $SPACE icon.color="$GRAY"
  fi
fi
