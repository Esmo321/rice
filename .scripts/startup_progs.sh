#!/bin/bash

#runs programs after wm is setup
#avoids any errors that might occur if a program runs before another one
#Example: if transmission-gtk runs before bspwm rules are set it will open on workspace 1
nm-applet &
unclutter &
#dwmbar &
toggle_redshift
transmission-gtk &
shownotes
