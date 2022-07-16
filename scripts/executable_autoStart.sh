#!/usr/bin/env bash

run(){
    if ! pgrep $1 ;
    then
        $@&
    fi
}

sh $HOME/scripts/monitorLayout.sh
sleep 2
sh $HOME/scripts/nvidiaPipeline.sh

nitrogen --restore &

sleep 5
run "/usr/bin/emacs --daemon"
#run discord

#startProgram 3 "discord"
#startProgram 4 "obsidian"
#startProgram 3 "lutris"
#startProgram 3 "steam"
#startProgram 3 "pulsemeeter"
#startProgram 3 "/usr/bin/emacs --daemon"
