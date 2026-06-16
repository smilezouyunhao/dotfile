#!/bin/bash

options=("⏻  Shutdown" "󰑐  Reboot" "󰒲  Hibernate" "󰗽  Logout")

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "电源菜单" -theme-str 'window {width: 240;}' -theme-str 'listview {lines: 4;}')

case "$choice" in
    "⏻  Shutdown")
        systemctl poweroff
        ;;
    "󰑐  Reboot")
        systemctl reboot
        ;;
    "󰒲  Hibernate")
        systemctl hibernate
        ;;
    "󰗽  Logout")
        hyprctl dispatch exit
        ;;
esac
