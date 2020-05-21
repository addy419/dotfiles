#!/bin/bash
status=`gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval 'Main.overview.visible'`

if [ "$status" == "(true, 'false')" ]; then
  for w in $(xdotool search --onlyvisible --name '.*'); do
    xdotool windowminimize "$w"; 
  done
else
  dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.overview.hide()'
fi
