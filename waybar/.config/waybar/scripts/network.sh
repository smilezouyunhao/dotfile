#!/bin/bash
# Get wifi signal strength for waybar

interface="wlp1s0"

# Get signal dBm from iw
signal=$(iw dev "$interface" link 2>/dev/null | grep 'signal:' | awk '{print $2}')

if [ -z "$signal" ]; then
    echo '{"text": "  N/A", "class": "disconnected"}'
    exit 0
fi

# Convert dBm to percentage
# -30 dBm = 100%, -90 dBm = 0%
dbm=$signal
if [ "$dbm" -ge -30 ]; then
    pct=100
elif [ "$dbm" -le -90 ]; then
    pct=0
else
    pct=$(( (dbm + 90) * 100 / 60 ))
fi

echo "{\"text\": \"  ${pct}%\"}"
