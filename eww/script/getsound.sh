#!/bin/zsh

# when sound output is muted, it returns "no"
# when sound output is not muted, it returns "yes"
current_stat=$(pactl list sinks | grep 'Mute:' | awk '{print $2}')

# this is actually a volume on left side
# so it may need an adjustment for binoral support in future
current_vol=$(pactl list sinks | awk '/^\sVolume:/ {print $5}')

spacing=''

if [[ $current_stat == "yes" ]]; then 
    echo "muted"
elif [[ $current_stat == "no" ]]; then
    for i in $(seq $((5 - ${#current_vol}))); do
        spacing="${spacing}-"
    done
    echo "${spacing}${current_vol}"
fi
