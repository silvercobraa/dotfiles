#!/bin/sh
#exec startxfce4
#xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
exec i3
