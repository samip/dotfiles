#!/bin/bash

# Get the default sink name
DEFAULT_SINK=$(pactl info | grep 'Default Sink' | cut -d ' ' -f3)

# Get the friendly name of the default sink
SINK_NAME=$(pactl list sinks short | grep "$DEFAULT_SINK" | cut -f2)
if echo "$SINK_NAME" | grep -qi "FiiO"; then
    OUTPUT="🔊 Speaker"
elif echo "$SINK_NAME" | grep -qi "Creative"; then
    OUTPUT="🎧 Headphone"
else
    OUTPUT="$SINK_NAME"
fi
echo "Output: $OUTPUT"

