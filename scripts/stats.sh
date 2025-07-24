#!/bin/bash

. colors.sh

CPU_WIDGET="cpu"
RAM_WIDGET="ram"
DISK_WIDGET="disk"
NETWORK_UP_WIDGET="network_up"
NETWORK_DOWN_WIDGET="network_down"

if [ "$CPU_USAGE" != "" ]; then
  sketchybar --set "$CPU_WIDGET" label="$CPU_USAGE"
  if [ "$(echo "$CPU_USAGE" | tr -d "%")" -gt 79 ]; then
    sketchybar --set "$CPU_WIDGET"  label.color="$ACCENT"
  else
    sketchybar --set "$CPU_WIDGET"  label.color="$GRAY"
  fi
fi

if [ "$RAM_USAGE" != "" ]; then
  sketchybar --set "$RAM_WIDGET"  label="$RAM_USAGE"
  if [ "$(echo "$RAM_USAGE" | tr -d "%")" -gt 79 ]; then
    sketchybar --set "$RAM_WIDGET"  label.color="$ACCENT"
  else
    sketchybar --set "$RAM_WIDGET"  label.color="$GRAY"
  fi
fi

if [ "$DISK_USAGE" != "" ]; then
  sketchybar --set "$DISK_WIDGET"  label="$DISK_USAGE"
  if [ "$(echo "$DISK_USAGE" | tr -d "%")" -gt 79 ]; then
    sketchybar --set "$DISK_WIDGET"  label.color="$ACCENT"
  else
    sketchybar --set "$DISK_WIDGET"  label.color="$GRAY"
  fi
fi

if [ "$NETWORK_RX_en0" != "" ] && [ "$NETWORK_TX_en0" != "" ]; then
  sketchybar --set "$NETWORK_DOWN_WIDGET"  label="DOWN $NETWORK_RX_en0"
  sketchybar --set "$NETWORK_UP_WIDGET" label="UP $NETWORK_TX_en0"
fi
