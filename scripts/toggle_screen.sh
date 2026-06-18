#!/bin/sh
STATE=$(busctl --user get-property org.gnome.Mutter.DisplayConfig /org/gnome/Mutter/DisplayConfig org.gnome.Mutter.DisplayConfig PowerSaveMode | cut -d ' ' -f 2)

if [ "$STATE" -eq 0 ]; then
    gsettings set org.gnome.desktop.screensaver lock-enabled false
    
    busctl --user set-property org.gnome.Mutter.DisplayConfig /org/gnome/Mutter/DisplayConfig org.gnome.Mutter.DisplayConfig PowerSaveMode i 1
else
    busctl --user set-property org.gnome.Mutter.DisplayConfig /org/gnome/Mutter/DisplayConfig org.gnome.Mutter.DisplayConfig PowerSaveMode i 0
    
    gsettings set org.gnome.desktop.screensaver lock-enabled true
fi
