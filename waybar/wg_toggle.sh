#!/bin/bash
IFACE="YOUR_INTERFACE_HERE"

# Authenticate once and cache the sudo session, so later commands
# don't each need a piped password (which would fight with the DNS pipe below).
echo <I_M_RISKY> | sudo -S -v

if ip link show "$IFACE" &>/dev/null; then
    sudo wg-quick down "$IFACE"
    printf 'nameserver 1.1.1.1\nnameserver 8.8.8.8\n' | sudo resolvconf -a enp7s0
    sudo resolvconf -u
else
    sudo resolvconf -u
    sudo wg-quick up "$IFACE"
fi

pkill -RTMIN+8 waybar
