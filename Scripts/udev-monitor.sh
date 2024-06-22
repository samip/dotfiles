#!/bin/bash

# Wait for a moment to ensure the monitor is fully connected
sleep 1

# Check if monitor is connected
if xrandr | grep -q 'connected'; then
    autorandr -c
fi
