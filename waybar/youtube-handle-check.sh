#!/usr/bin/env bash

HANDLE="Tarandir"
URL="https://www.youtube.com/@${HANDLE}"

status=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

if [ "$status" -eq 404 ]; then
    # Handle is available
    echo "{\"text\": \"✔ YT AVAILABLE\", \"tooltip\": \"Handle Tarandir seems free\", \"class\": \"free\"}"
else
    # Handle is taken
    echo "{\"text\": \"YT:NO\", \"tooltip\": \"Handle Tarandir is taken\", \"class\": \"taken\"}"
fi


