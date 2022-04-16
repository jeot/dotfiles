#!/bin/sh

setxkbmap -model pc104 -layout us,ir -variant ,, -option grp:shifts_toggle
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Escape = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Escape"
xmodmap -e "add Lock = Caps_Lock"



