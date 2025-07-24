#!/bin/bash

# Requires media-control installed.
# `brew tap ungive/media-control`
# `brew install media-control`

MEDIA_DATA=$(media-control get)
IS_PLAYING=$(echo "$MEDIA_DATA" | jq -r '.playing')
APP_PLAYING=$(echo "$MEDIA_DATA" | jq -r '.bundleIdentifier')

visible() {
  sketchybar --animate circ 30 --set media_playback background.drawing=on
}

hidden() {
  sketchybar --animate circ 30 --set media_playback background.drawing=off
}

if [ "$IS_PLAYING" == true ] && [ "$APP_PLAYING" == "com.spotify.client" ]; then
  TITLE=$(echo "$MEDIA_DATA" | jq -r '.title')
  CURRENT_TITLE=$(sketchybar --query media_playback | jq -r '.icon.value')

  if [ "$TITLE" != "$CURRENT_TITLE" ]; then
    ALBUM=$(echo "$MEDIA_DATA" | jq -r '.album')
    FILE="/tmp/media-covers/$ALBUM.jpeg"

    if [ ! -f "$FILE" ]; then
      echo "$MEDIA_DATA" | jq -r '.artworkData' | base64 -d > "$FILE" && magick "$FILE" -resize 80x80^ -gravity center -extent 80x80 "$FILE"
      sleep 0.1
    fi

    sketchybar --set media_playback icon="$TITLE" background.image="$FILE"
  fi

  visible
else
  hidden
fi
