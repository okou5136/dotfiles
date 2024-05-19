#!/bin/zsh

windowname=`xdotool getwindowfocus getwindowname`

if [[ ${#windowname} -gt 10 ]]; then
    window=`echo ${windowname} | cut -c -10 | awk '{print$0 " ..."}'`
elif [[ $windowname == "i3" ]]; then
    window=""
else 
    window=$windowname
fi

echo "${window}"
