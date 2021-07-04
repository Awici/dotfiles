#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Kills and restarts sxhkd
pgrep -x sxhkd > /dev/null || sxhkd &

picom &
nitrogen --restore &
dunst &

$HOME/.config/polybar/forest/launch.sh &
