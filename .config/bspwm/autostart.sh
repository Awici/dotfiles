#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Kills and restarts sxhkd
pgrep -x sxhkd > /dev/null || sxhkd &

run picom &
run xrdb merge ~/.Xresources &
run nitrogen --restore &
run setxkbmap gb &
run dunst &
run fcitx -d &

run $HOME/.config/polybar/forest/launch.sh &
