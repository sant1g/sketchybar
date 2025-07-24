#!/bin/bash

STATUS=$(sketchybar --query "$NAME" | jq -r '.label.value')

if [ "$STATUS" == "ON" ]; then
  pkill -f Docker
  sleep 5
else
  open -a Docker
  sleep 5
fi
