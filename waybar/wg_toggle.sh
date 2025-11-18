#!/usr/bin/env bash

WG_INTERFACE="YOUR_WG_INTERFACE_HERE"

# Check if interface exists and is up
if ip link show "$WG_INTERFACE" &>/dev/null; then
    # Turn it off
    sudo wg-quick down "$WG_INTERFACE"
else
    # Turn it on
    sudo wg-quick up "$WG_INTERFACE"
fi

