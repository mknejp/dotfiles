#!/usr/bin/env bash

state_dir=~/.local/state/hyprland/scripts
state_file=$state_dir/last_special_workspace

name=$(hyprctl activewindow -j | jq -r 'select(.workspace .id < 0) | .workspace .name' | sed 's/^special://g')
if [[ -n $name ]]; then
	mkdir -p $state_dir
	echo "$name" > $state_file
	hyprctl dispatch togglespecialworkspace "$name"
else
	hyprctl dispatch togglespecialworkspace "$(cat $state_file)"
fi
