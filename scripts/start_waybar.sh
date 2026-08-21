#!/bin/sh

killall -q waybar
hyprpaper -q

if [[ $USER = "chazelam" ]]
then
    waybar -c ~/dotfiles/config/waybar/config.jsonc -s ~/dotfiles/config/waybar/style.css
    hyprpaper -c ~/dotfiles/config/hypr/hyprpaper.conf
else
    waybar
    hyprpaper
fi
