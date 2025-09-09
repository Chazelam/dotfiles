#!/bin/bash

active_json=$(hyprctl -j activewindow)
pid=$(echo "$active_json" | jq -r '.pid')
exe_path=$(readlink -f /proc/$pid/exe)
width=$(echo "$active_json" | jq -r '.size[0]')
height=$(echo "$active_json" | jq -r '.size[1]')
title=$(echo "$active_json" | jq -r '.title')
class=$(echo "$active_json" | jq -r '.class')

output="Title: $title
Class: $class
Executable path: $exe_path
Resolution: ${width}x${height}"

# Копируем в буфер обмена (Wayland)
echo "$output" | wl-copy

# Отправляем уведомление (можно адаптировать длину сообщения)
notify-send "Active window info" "$output"
