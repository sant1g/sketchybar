#!/bin/bash

# Requires SwitchAudioSource installed.
# `brew install switchaudio-osx`

OUTPUT=$(SwitchAudioSource -c -t output -f json | jq -r '.name')

if [ "$OUTPUT" = "MacBook Pro Speakers" ]; then
  OUTPUT="Mac Speakers"
fi

sketchybar --set "$NAME" label="$OUTPUT"
