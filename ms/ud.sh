#!/bin/bash


err()
{
  echo >&2 "$(tput bold; tput setaf 1)[-] ERROR: ${*}$(tput sgr0)"

  exit 1337
}

msg()
{
  echo "$(tput bold; tput setaf 2)[+] ${*}$(tput sgr0)"
}

check_priv()
{
  if [ $(id -u) -ne 0 ]; then
    err "Must be root"
  fi
}

get_country()
{
  tool='curl'
  opts='-s --connect-timeout 8'
  ipserver='ipinfo.io'
  
  data=$(curl -s $ipserver)

  if [ $? -ne 0 ]; then
    err "No internet connection"
  else
    echo $data | jq -r '.country'
  fi
  
}

main()
{
  msg "Checking UID"
  check_priv
  country=$(get_country)
  msg "Country: $country"
  reflector --verbose --country $country --latest 20 -f 10 -a 12 --protocol https --sort rate --download-timeout 10 --save /etc/pacman.d/mirrorlist
  msg "Updated reflector"
}

main

