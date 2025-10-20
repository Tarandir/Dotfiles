#!/usr/bin/env bash

API_KEY="nah-nah-nah"
CITY_ID="nununu"

# --- CURRENT WEATHER ---
weather=$(curl -s "https://api.openweathermap.org/data/2.5/weather?id=$CITY_ID&appid=$API_KEY&units=metric")
temp_now=$(echo "$weather" | jq '.main.temp' | cut -d '.' -f1)
desc_now=$(echo "$weather" | jq -r '.weather[0].main')

case $desc_now in
    Clear) icon_now="☀️" ;;
    Clouds) icon_now="☁️" ;;
    Rain) icon_now="🌧️" ;;
    Snow) icon_now="❄️" ;;
    Drizzle) icon_now="🌦️" ;;
    Thunderstorm) icon_now="⛈️" ;;
    *) icon_now="🌡️" ;;
esac

# --- TOMORROW FORECAST (FROM 5-DAY/3-HOUR API) ---
forecast=$(curl -s "https://api.openweathermap.org/data/2.5/forecast?id=$CITY_ID&appid=$API_KEY&units=metric")
tomorrow=$(date -d "tomorrow" +%Y-%m-%d)

# Get all entries for tomorrow
tomorrow_entries=$(echo "$forecast" | jq -c ".list[] | select(.dt_txt | startswith(\"$tomorrow\"))")

# Extract temperatures
temps=$(echo "$tomorrow_entries" | jq -r ".main.temp")
min_temp=$(echo "$temps" | sort -n | head -1)
max_temp=$(echo "$temps" | sort -n | tail -1)

# Round temps
min_temp=$(printf "%.0f" "$min_temp")
max_temp=$(printf "%.0f" "$max_temp")

# Get most frequent weather description
desc_tomorrow=$(echo "$tomorrow_entries" | jq -r ".weather[0].main" | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')

# Choose icon
case $desc_tomorrow in
    Clear) icon_tomorrow="☀️" ;;
    Clouds) icon_tomorrow="☁️" ;;
    Rain) icon_tomorrow="🌧️" ;;
    Snow) icon_tomorrow="❄️" ;;
    Drizzle) icon_tomorrow="🌦️" ;;
    Thunderstorm) icon_tomorrow="⛈️" ;;
    *) icon_tomorrow="🌡️" ;;
esac

# --- OUTPUT FORMAT FOR WAYBAR ---
echo "${temp_now}°C $icon_now $desc_now | Tomorrow: $icon_tomorrow $desc_tomorrow ${min_temp}°/${max_temp}°C"

