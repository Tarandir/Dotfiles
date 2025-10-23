#!/usr/bin/env bash

# Find the main keyboard (the one marked "main: yes")
MAIN_KEYBOARD=$(hyprctl devices | awk '/Keyboard/{name=$3} /main: yes/{print name}')

# Get the active keymap for that keyboard
LAYOUT=$(hyprctl devices | awk -v kb="$MAIN_KEYBOARD" '
  $0 ~ kb {f=1}
  f && /active keymap:/ {print $3; exit}
')

# Shorten names
case "$LAYOUT" in
  *"English (US)"* | *"US"*) SYMBOL="US" ;;
  *"Russian"* | *"RU"*) SYMBOL="RU" ;;
  *"English"*) SYMBOL="EN" ;;  # catches generic "English"
  *) SYMBOL="EN" ;;  # fallback if unrecognized
esac

printf "%s\n" "$SYMBOL"

