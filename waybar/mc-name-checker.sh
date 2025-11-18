#!/usr/bin/env bash

USERNAME="Kotarina"   # change to the name you want to monitor

API="https://api.mojang.com/users/profiles/minecraft/$USERNAME"
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$API")

if [ "$RESPONSE" = "200" ]; then
    # Name exists → taken
    echo "{\"text\": \"MC:NO\", \"tooltip\": \"Minecraft username '$USERNAME' is TAKEN\", \"class\": \"taken\"}"
else
    # Name does NOT exist → available
    echo "{\"text\": \"✔ $USERNAME AVAILABLE!!!\", \"tooltip\": \"Minecraft username '$USERNAME' is AVAILABLE!\", \"class\": \"free\"}"
fi

