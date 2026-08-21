#!/usr/bin/env bash

sudo pacman -S --needed zram-generator earlyoom

sudo cp system/zram-generator.conf /etc/systemd/
sudo cp system/99-memory.conf /etc/sysctl.d/

sudo systemctl daemon-reload
sudo systemctl enable --now earlyoom
sudo systemctl start systemd-zram-setup@zram0

sudo sysctl --system