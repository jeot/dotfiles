#!/bin/sh

setxkbmap -model pc104 -layout us,ir -variant ,, -option grp:shifts_toggle
xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = Escape"



