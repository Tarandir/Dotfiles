#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

# Wait for hyprpaper to be ready
for i in {1..10}; do
    SOCKET=$(find /run/user/1000/hypr -type s -name "*.hyprpaper.sock" 2>/dev/null | head -n1)
    [ -n "$SOCKET" ] && break
    sleep 0.5
done

# Apply the new wallpaper
if [ -n "$SOCKET" ]; then
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ",$WALLPAPER"
else
    notify-send "Hyprpaper not running"
fi

