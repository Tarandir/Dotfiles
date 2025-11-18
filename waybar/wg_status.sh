# Your WireGuard interface name
WG_INTERFACE="YOUR_WG_INTERFACE_NAME_HERE"

# Check if the interface exists and has peers
if ip link show "$WG_INTERFACE" &>/dev/null; then
    # Check if any handshake happened or interface has IP
    WG_INFO=$(wg show "$WG_INTERFACE" 2>/dev/null)
    if [ -n "$WG_INFO" ]; then
        # Interface exists, show it as ON
        ICON=""
        STATUS="ON"
    else
        ICON="󰒘"  # Up but no peers yet
        STATUS="ON"
    fi
else
    ICON="󰦞"
    STATUS="OFF"
fi

# Output for Waybar
echo "$ICON $STATUS"
