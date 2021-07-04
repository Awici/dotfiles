#!/bin/env bash

# Options for powermenu
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
sleep=" Sleep"
logout=" Logout"

prompt() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are you sure you want to $1?"\
		# -theme $dir/confirm.rasi
}

msg() {
	rofi -e "$@"
}

confirm() {
  # Arguments:
  #   1 = selected option
  #   2 = command to run
  ans=$(prompt $1 &)
  if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
    $2
  elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
    return 0
  else
    msg "Available Options  -  yes / y / no / n"
  fi
}

# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
                  -config "~/.config/rofi/config.rasi"\
                  -font "Ioveska Nerd Font 15"\
                  -width "15"\
                  -lines 5\
                  -line-margin 3\
                  -line-padding 10\
                  -scrollbar-width "0" )

case $selected_option in
  $lock)
    betterlockscreen -l dimblur;;
  $logout)
    confirm "logout" "bspc quit";;
  $shutdown)
    confirm "shutdown" "systemctl poweroff";;
  $reboot)
    confirm "reboot" "systemctl reboot";;
  $sleep)
    confirm "sleep" "amixer set Master mute; systemctl suspend";;
esac

