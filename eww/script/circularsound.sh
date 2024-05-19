#!/bin/sh

current_stat=$(pactl list sinks | grep 'Mute:' | awk '{print $2}')

current_vol=$(pactl list sinks | awk '/^\sVolume:/ {print $5}' | sed 's/.$//')

if [[ $current_vol -gt 100 ]]; then
    current_vol=100
elif [[ $current_vol -lt 0 ]]; then
    current_vol=0
fi


echo "{\"stat\":\"$current_stat\",\"vol\":\"$current_vol\"}";
