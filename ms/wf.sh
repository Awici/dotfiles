#!/bin/bash

STATE=$(nmcli r wifi)

if [[ "$STATE" == "disabled" ]]
then
  echo "Wifi turned on..."
  nmcli r wifi on
else
  echo "Wifi turned off..."
  nmcli r wifi off
fi

