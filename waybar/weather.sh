#!/usr/bin/env bash

API_KEY="nununu"
CITY_ID="nununu"
CACHE_FILE="$HOME/.cache/waybar-weather.txt"

mkdir -p "$(dirname "$CACHE_FILE")"

# curl_json URL -> prints body on success (HTTP 200 + non-empty), empty string otherwise.
curl_json() {
    curl -sf --max-time 8 --retry 2 --retry-delay 1 "$1" 2>/dev/null
}

icon_for() {
    case "$1" in
        Clear) echo "☀️" ;;
        Clouds) echo "☁️" ;;
        Rain) echo "☂️" ;;
        Snow) echo "❄️" ;;
        Drizzle) echo "☂️" ;;
        Thunderstorm) echo "⚡" ;;
        Fog) echo "≋" ;;
        Mist) echo "~" ;;
        Smoke) echo "≋" ;;
        Haze) echo "~" ;;
        Dust|Sand) echo "≋" ;;
        Ash) echo "≋" ;;
        Squall) echo "🌬️" ;;
        Tornado) echo "🌪️" ;;
        *) echo "⋯" ;;
    esac
}

fail() {
    # On any failure, prefer the last good reading over showing a bare "...".
    if [ -s "$CACHE_FILE" ]; then
        cat "$CACHE_FILE"
    else
        echo "⋯ weather unavailable"
    fi
    exit 0
}

# --- CURRENT WEATHER ---
weather=$(curl_json "https://api.openweathermap.org/data/2.5/weather?id=$CITY_ID&appid=$API_KEY&units=metric")
[ -z "$weather" ] && fail

temp_now=$(echo "$weather" | jq -r '.main.temp // empty' | cut -d '.' -f1)
desc_now=$(echo "$weather" | jq -r '.weather[0].main // empty')
[ -z "$temp_now" ] || [ -z "$desc_now" ] && fail

icon_now=$(icon_for "$desc_now")

# --- TOMORROW FORECAST (FROM 5-DAY/3-HOUR API) ---
forecast=$(curl_json "https://api.openweathermap.org/data/2.5/forecast?id=$CITY_ID&appid=$API_KEY&units=metric")
[ -z "$forecast" ] && fail

tomorrow=$(date -d "tomorrow" +%Y-%m-%d)

tomorrow_entries=$(echo "$forecast" | jq -c ".list[] | select(.dt_txt | startswith(\"$tomorrow\"))")
[ -z "$tomorrow_entries" ] && fail

temps=$(echo "$tomorrow_entries" | jq -r ".main.temp")
min_temp=$(echo "$temps" | sort -n | head -1)
max_temp=$(echo "$temps" | sort -n | tail -1)
min_temp=$(printf "%.0f" "$min_temp" 2>/dev/null)
max_temp=$(printf "%.0f" "$max_temp" 2>/dev/null)

desc_tomorrow=$(echo "$tomorrow_entries" | jq -r ".weather[0].main" | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')
icon_tomorrow=$(icon_for "$desc_tomorrow")

# --- OUTPUT FORMAT FOR WAYBAR ---
output="${temp_now}°C  $icon_now  <span color='#666'>$desc_now</span> | <span color='#666'>TM:</span>  <span color='#3B9AFF'>${min_temp}°</span> <span color='#666'>to</span> <span color='#FAA20A'>${max_temp}°C</span>  $icon_tomorrow  <span color='#666'>$desc_tomorrow</span>"

echo "$output" | tee "$CACHE_FILE"z
