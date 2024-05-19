#!/bin/zsh

languages=("us" "de" "ru" "fr" "jp" "br")
current_language=$(setxkbmap -query | grep layout | sed "s/layout://g" | sed "s/ //g")
counter=0
match=false


for i in ${languages[@]} 
do 
    echo $counter
    echo ${#languages[@]}
    if [ $i = $current_language ] && [ $counter -ne $((${#languages[@]} - 1)) ]; then
        if [ ${languages[($counter + 1)]} -ne "jp" ]; then
            xdotool key 'Hankaku'
            match=true
        fi
        setxkbmap ${languages[($counter + 1)]}
    elif [ $i = $current_language ] && [ $counter -eq $((${#languages[@]} - 1)) ]; then
        setxkbmap ${languages[0]}
        match=true
    fi
    counter=$((counter+1))
done

if [[ !match ]]; then 
    setxkbmap "us";
fi
