#!/bin/bash
killall -9 waybar
sleep 1
waybar &
waybar --config ~/.config/waybar/config-bottom.jsonc
