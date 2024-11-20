#!/bin/sh

case $1 in
  off)
    xrandr --output HDMI-1-1 --off
    xrandr --output HDMI-0 --off
  ;;
  *)
    xrandr --output DVI-D-0 --mode 1920x1080 --rate 120 --pos 0x0 
    xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --pos 0x0 
    xrandr --output HDMI-1-1 --mode 1920x1080 --pos 1920x0
esac
