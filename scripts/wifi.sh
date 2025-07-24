#!/bin/bash

. colors.sh

SSID="$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')"
IP="$(ipconfig getsummary en0 | awk -F 'ciaddr = '  '/ciaddr = / {print $2}')"

if [ "$SSID" = "<redacted>" ]; then
  SSID="$(system_profiler SPAirPortDataType -json | jq -r '.SPAirPortDataType[].spairport_airport_interfaces[].spairport_current_network_information._name' | head -n 1)"
fi

if [ "$SSID" = "" ]; then
  SSID="Disconnected"
fi

sketchybar --set "$NAME" label="$SSID" drawing=on
