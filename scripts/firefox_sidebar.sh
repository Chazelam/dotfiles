#!/bin/bash

# focused=$(hyprctl activewindow -j | jq -r '.class')

active_window_class=$(hyprctl activewindow -j | jq -r ".class")

if [ "$active_window_class" = "org.mozilla.firefox" ]; then

# if [ "$focused" = "org.mozilla.firefox" ]; then
    wtype -M ctrl -M alt -k z
else
    # fallback: actually send Ctrl+B
    wtype -M ctrl -k b
    # wtype -M ctrl -P b -p b -m ctrl
fi


# Title: Firefox shortcut change guide — Mozilla Firefox
# Class: org.mozilla.firefox
# Executable path: /usr/lib64/firefox/firefox
# Resolution: 943x1146

# Title: Untitled - Obsidian-vault - Obsidian v1.8.10
# Class: obsidian
# Executable path: /tmp/.mount_ObsidixL36hY/obsidian
# Resolution: 1898x1146
