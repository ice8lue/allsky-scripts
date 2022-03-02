#!/bin/bash

while endless=0; do 
    temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
    echo "Current CPU temperature: $temp"
    
    if [$temp < 50]; then
        echo "Too cold, heating up for 10min."
        stress-ng --cpu 0 --matrix-size 256 --tz  -t 600
    else
        echo "Warm enough, sleeping for 2min."
        sleep 120;
    fi
done