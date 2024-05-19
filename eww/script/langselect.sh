#!/bin/sh

if setxkbmap $1; then
    notify-send "Notice" "Language has been changed to $1";
else
    notify-send "Error" "Language has not been changed";
fi
    
