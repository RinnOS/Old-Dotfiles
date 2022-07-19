#!/usr/bin/env bash

run(){
    if ! pgrep $1 ;
    then
        $@&
    fi
}

sh $HOME/scripts/monitorLayout.sh
sleep .5
nitrogen --restore &
run picom
sleep 2
sh $HOME/scripts/nvidiaPipeline.sh

sleep 3
run dunst
run blueman-manager
run "/usr/bin/emacs --daemon"
run pulsemeeter
run $HOME/Applications/Rambox-*.AppImage
run discord
run steam
run lutris
run spotify

#startProgram 3 "discord"
#startProgram 4 "obsidian"
#startProgram 3 "lutris"
#startProgram 3 "steam"
#startProgram 3 "pulsemeeter"
#startProgram 3 "/usr/bin/emacs --daemon"
