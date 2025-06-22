#!/bin/bash
active_window_class=$(hyprctl activewindow -j | jq -r ".class")
if [ "$active_window_class" = "obsidian" ]; then
  exit 0
else
  hyprctl dispatch killactive ""
fi
