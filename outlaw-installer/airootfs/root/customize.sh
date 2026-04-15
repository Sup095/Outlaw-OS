#!/bin/bash
pacman -Syu --noconfirm
pacman -S --noconfirm outlaw-shell
systemctl enable NetworkManager iwd apparmor
xdg-mime default opera-gx.desktop x-scheme-handler/http x-scheme-handler/https
mkdir -p /usr/share/outlaw-os
cp -r /outlaw-shell/* /usr/share/outlaw-os/
echo "operator ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "outlaw-os" > /etc/hostname
