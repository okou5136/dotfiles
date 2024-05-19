#!/bin/zsh

current_language=$(setxkbmap -query | grep layout | sed "s/layout://g" | sed "s/ //g")


