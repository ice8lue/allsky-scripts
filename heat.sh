#!/bin/bash

exec 1> >(logger -s -t $(basename $0)) 2>&1

while true; do
    temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
    echo "Current CPU temperature: $temp"

    if (( $(echo "$temp < 40" | bc -l) )); then
        echo "Too cold, heating up for 10min..."
        stress-ng --cpu 3 --matrix-size 256 --tz  -t 600 &> /dev/null
    else
        echo "Warm enough, sleeping for 1min."
        sleep 60;
    fi
done