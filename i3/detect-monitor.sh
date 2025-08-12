#!/bin/bash
HDMI_CONNECTED=$(xrandr | grep "HDMI-A-0 connected")
if [[ -z "$HDMI_CONNECTED" ]]; then
    echo "NONE"
fi

E_DP_ON=$(xrandr --listmonitors | grep -q "eDP" && echo "yes" || echo "no")
HDMI_ON=$(xrandr --listmonitors | grep -q "HDMI-A-0" && echo "yes" || echo "no")
if [[ "$E_DP_ON" == "yes" && "$HDMI_ON" == "yes"  ]]; then
    echo "BOTH"
elif [[ "$E_DP_ON" == "yes" && "$HDMI_ON" == "no"  ]]; then
    echo "PRIMARY"
elif [[ "$E_DP_ON" == "no" && "$HDMI_ON" == "yes"  ]]; then
    echo "SECONDARY"
elif [[ "$E_DP_ON" == "no" && "$HDMI_ON" == "no"  ]]; then
    echo "NONE"
fi
