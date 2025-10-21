#!/bin/sh
# Restart waybar
killall waybar

waybar -c ~/.config/waybar/config & -s ~/.config/waybar/style.css
