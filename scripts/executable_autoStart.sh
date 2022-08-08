#!/usr/bin/env bash

APP="$HOME/Applications"

run(){
    if ! pgrep $1 ;
    then
        $@&
    fi
}

sh $HOME/scripts/monitorLayout.sh
sleep 1
sh $HOME/scripts/nvidiaPipeline.sh
sleep 2
run picom
sleep 2
nitrogen --restore

sleep 3
run dunst
run blueman-applet
run "/usr/bin/emacs --daemon"
run pulsemeeter
run $APP/Rambox-*.AppImage
run discord
run steam
run lutris
run spotify
run inkdrop

# run "alacritty --class fm,fm -e ranger"
# run "alacritty --class sound,sound -e pulsemixer"

#startProgram 3 "discord"
#startProgram 4 "obsidian"
#startProgram 3 "lutris"
#startProgram 3 "steam"
#startProgram 3 "pulsemeeter"
#startProgram 3 "/usr/bin/emacs --daemon"
