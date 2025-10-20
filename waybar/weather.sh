#!/bin/bash

# Your OpenWeatherMap API key
API_KEY="nah-ah"
# Your city ID (you can get it from https://openweathermap.org/find)
CITY_ID="nununu"

# Fetch weather (current temperature + description)
weather=$(curl -s "https://api.openweathermap.org/data/2.5/weather?id=$CITY_ID&appid=$API_KEY&units=metric")

temp=$(echo "$weather" | jq '.main.temp' | cut -d '.' -f1)
desc=$(echo "$weather" | jq -r '.weather[0].main')


case $desc in
    Clear) icon="☀️" ;;
    Clouds) icon="☁️" ;;
    Rain) icon="🌧️" ;;
    Snow) icon="❄️" ;;
    Drizzle) icon="🌦️" ;;
    Thunderstorm) icon="⛈️" ;;
    *) icon="🌡️" ;;
esac


# Print for Waybar
echo "$temp°C $icon $desc"

