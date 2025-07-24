#!/bin/bash

STATUS=$(sketchybar --query "$NAME" | jq -r '.label.value')

if [ "$STATUS" == "ON" ]; then
  osascript -e "tell application \"Tunnelblick\" to disconnect \"sgomez\""
  sleep 3
else
  osascript -e "tell application \"Tunnelblick\" to connect \"sgomez\""
  sleep 3
fi
