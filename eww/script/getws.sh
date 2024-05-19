#!/bin/sh

focused=$(i3-msg -t get_workspaces | jq ".[] | select(.focused=="true")" | jq ".num");
actives=$(i3-msg -t get_workspaces | jq ".[].num" | tr -d '\n');

echo "{\"focused\":\"$focused\",\"active\":\"$actives\"}"
