#!/bin/sh

if [ "$DESKTOP_SESSION" = "xfce" ]; then 
   sleep 20s
   killall conky
   cd "$HOME/.conky/activity_conky_viewer_lua54"
   conky -c "$HOME/.conky/activity_conky_viewer_lua54/conkyrc" &
   exit 0
fi
