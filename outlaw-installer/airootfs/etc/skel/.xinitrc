#!/bin/sh
picom --backend glx --vsync &
exec electron /usr/share/outlaw-os/index.html --no-sandbox --kiosk
