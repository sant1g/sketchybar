#!/bin/sh

. colors.sh
. .env

get_bg() {
if [[ $is_day == 1 ]]; then
    case $code in
        1000) icon=clear.png ;; # Sunny, Clear/113
        1003) icon=patchy.png ;; # Partly cloudy/116
        1006) icon=cloud.png ;; # Cloudy/119
        1009) icon=cloud.png ;; # Overcast/122
        1030) icon=mist.png ;; # Mist/143
        1063) icon=rain.png ;; # Patchy rain possible/176
        1066) icon=snow.png ;; # Patchy snow possible/179
        1069) icon=rain.png ;; # Patchy sleet possible/182
        1072) icon=rain.png ;; # Patchy freezing drizzle possible/185
        1087) icon=thunder.png ;; # Thundery outbreaks possible/200
        1114) icon=snow.png ;; # Blowing snow/227
        1117) icon=rain.png ;; # Blizzard/230
        1135) icon=fog.png ;; # Fog/248
        1147) icon=fog.png ;; # Freezing fog/260
        1150) icon=rain.png ;; # Patchy light drizzle/263
        1153) icon=rain.png ;; # Light drizzle/266
        1168) icon=rain.png ;; # Freezing drizzle/281
        1171) icon=rain.png ;; # Heavy freezing drizzle/284
        1180) icon=rain.png ;; # Patchy light rain/293
        1183) icon=rain.png ;; # Light rain/296
        1186) icon=rain.png ;; # Moderate rain at times/299
        1189) icon=rain.png ;; # Moderate rain/302
        1192) icon=rain.png ;; # Heavy rain at times/305
        1195) icon=rain.png ;; # Heavy rain/308
        1198) icon=rain.png ;; # Light freezing rain/311
        1201) icon=rain.png ;; # Moderate or heavy freezing rain/314
        1204) icon=rain.png ;; # Light sleet/317
        1207) icon=rain.png ;; # Moderate or heavy sleet/320
        1210) icon=snow.png ;; # Patchy light snow/323
        1213) icon=snow.png ;; # Light snow/326
        1216) icon=snow.png ;; # Patchy moderate snow/329
        1219) icon=snow.png ;; # Moderate snow/332
        1222) icon=snow.png ;; # Patchy heavy snow/335
        1225) icon=snow.png ;; # Heavy snow/338
        1237) icon=rain.png ;; # Ice pellets/350
        1240) icon=rain.png ;; # Light rain shower/353
        1243) icon=rain.png ;; # Moderate or heavy rain shower/356
        1246) icon=rain.png ;; # Torrential rain shower/359
        1249) icon=rain.png ;; # Light sleet showers/362
        1252) icon=rain.png ;; # Moderate or heavy sleet showers/365
        1255) icon=snow.png ;; # Light snow showers/368
        1258) icon=snow.png ;; # Moderate or heavy snow showers/371
        1261) icon=rain.png ;; # Light showers of ice pellets/374
        1264) icon=rain.png ;; # Moderate or heavy showers of ice pellets/377
        1273) icon=thunder.png ;; # Patchy light rain with thunder/386
        1276) icon=thunder.png ;; # Moderate or heavy rain with thunder/389
        1279) icon=thunder.png ;; # Patchy light snow with thunder/392
        1282) icon=thunder.png ;; # Moderate or heavy snow with thunder/395
    esac
else
    case $code in
        1000) icon=clear_night.png ;; # Sunny, Clear/113
        1003) icon=patchy_night.png ;; # Partly cloudy/116
        1006) icon=cloud.png ;; # Cloudy/119
        1009) icon=cloud.png ;; # Overcast/122
        1030) icon=mist.png ;; # Mist/143
        1063) icon=rain.png ;; # Patchy rain possible/176
        1066) icon=snow.png ;; # Patchy snow possible/179
        1069) icon=rain.png ;; # Patchy sleet possible/182
        1072) icon=rain.png ;; # Patchy freezing drizzle possible/185
        1087) icon=thunder.png ;; # Thundery outbreaks possible/200
        1114) icon=snow.png ;; # Blowing snow/227
        1117) icon=snow.png ;; # Blizzard/230
        1135) icon=fog.png ;; # Fog/248
        1147) icon=fog.png ;; # Freezing fog/260
        1150) icon=rain.png ;; # Patchy light drizzle/263
        1153) icon=rain.png ;; # Light drizzle/266
        1168) icon=rain.png ;; # Freezing drizzle/281
        1171) icon=rain.png ;; # Heavy freezing drizzle/284
        1180) icon=rain.png ;; # Patchy light rain/293
        1183) icon=rain.png ;; # Light rain/296
        1186) icon=rain.png ;; # Moderate rain at times/299
        1189) icon=rain.png ;; # Moderate rain/302
        1192) icon=rain.png ;; # Heavy rain at times/305
        1195) icon=rain.png ;; # Heavy rain/308
        1198) icon=rain.png ;; # Light freezing rain/311
        1201) icon=rain.png ;; # Moderate or heavy freezing rain/314
        1204) icon=rain.png ;; # Light sleet/317
        1207) icon=rain.png ;; # Moderate or heavy sleet/320
        1210) icon=snow.png ;; # Patchy light snow/323
        1213) icon=snow.png ;; # Light snow/326
        1216) icon=snow.png ;; # Patchy moderate snow/329
        1219) icon=snow.png ;; # Moderate snow/332
        1222) icon=snow.png ;; # Patchy heavy snow/335
        1225) icon=snow.png ;; # Heavy snow/338
        1237) icon=snow.png ;; # Ice pellets/350
        1240) icon=rain.png ;; # Light rain shower/353
        1243) icon=rain.png ;; # Moderate or heavy rain shower/356
        1246) icon=rain.png ;; # Torrential rain shower/359
        1249) icon=rain.png ;; # Light sleet showers/362
        1252) icon=rain.png ;; # Moderate or heavy sleet showers/365
        1255) icon=snow.png ;; # Light snow showers/368
        1258) icon=snow.png ;; # Moderate or heavy snow showers/371
        1261) icon=rain.png ;; # Light showers of ice pellets/374
        1264) icon=rain.png ;; # Moderate or heavy showers of ice pellets/377
        1273) icon=thunder.png ;; # Patchy light rain with thunder/386
        1276) icon=thunder.png ;; # Moderate or heavy rain with thunder/389
        1279) icon=thunder.png ;; # Patchy light snow with thunder/392
        1282) icon=thunder.png ;; # Moderate or heavy snow with thunder/395
    esac
fi
}

API="http://api.weatherapi.com/v1/current.json"
QUERY="MDQ"

for i in {1..4}; do
    weather=$(curl -sf --retry 3 "$API?key=$WEATHERAPI_KEY&q=$QUERY")
    if [[ -z $weather || $(echo $weather | jq -r ".current") == '{}' ]]; then
        echo "[WARNING] Weather API request failed $(echo $weather | jq -r ".current")" >&2
        if ((i == 4)); then
            echo "[ERROR] Weather API request failed 4 times" >&2
            exit 0
        fi
        sleep 10
    else
        break
    fi
done

temp=$(echo "$weather" | jq -r ".current.temp_c")
is_day=$(echo "$weather" | jq -r ".current.is_day")
code=$(echo "$weather" | jq -r ".current.condition.code")

get_bg

sketchybar --set "$NAME" drawing=on label="${temp%%.*}*C" icon.color=$FG
sketchybar --set weather_icon drawing=on background.image="./resources/weather_icons/$icon" background.image.drawing=on
