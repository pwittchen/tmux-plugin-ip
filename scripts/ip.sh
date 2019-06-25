#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# please note: this plugin is adjusted for my laptop only right now (thinkpad t470s, Ubuntu 17.10)
# it may be improved in the future

function get_ip_wlan() {
  no_of_broadcasts="$(ifconfig | grep broadcast | wc -l)"
  if [ $no_of_broadcasts -gt "0" ]; then
    ip="$(ifconfig | grep broadcast | awk '{print $2}' | tail -n1)"
  fi
}

function get_ip_eth() {
  ip="$(ifconfig | grep ether | awk '{print $2}')"
  if [[ $ip != *"."* ]]; then
    ip=""
  fi
}

function print_ip() {
  get_ip_wlan
  if [ ! -z "$ip" ]; then
    echo "$ip"
  else
    get_ip_eth
    if [ ! -z "$ip" ]; then
      echo $ip
    else
      echo "not connected"
    fi
  fi
}

main() {
  print_ip
}

main
