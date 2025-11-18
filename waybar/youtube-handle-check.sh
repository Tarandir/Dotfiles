#!/usr/bin/env bash

HANDLE="DESIRED_HANDLE_HERE"
URL="https://www.youtube.com/@${HANDLE}"

status=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

if [ "$status" -eq 404 ]; then
    # Handle is available
    echo "{\"text\": \"✔ YT AVAILABLE\", \"tooltip\": \"Handle seems free\", \"class\": \"free\"}"
else
    # Handle is taken
    echo "{\"text\": \"YT:NO\", \"tooltip\": \"Handle is taken\", \"class\": \"taken\"}"
fi


