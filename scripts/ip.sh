#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

function get_ip() {
    ip=$(ifconfig | grep -A 1 $netInterface | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)
}

# it's my SAP specific config
function get_ip_corpo() {
    ip=$(ifconfig | grep -A 1 'en5' | tail -1 | awk '{print $2}')
}

function print_ip() {
  netInterface='wlan0'
  get_ip

  if [ ! -z "$ip" ]; then
    if [[ $ip == *.* ]] ; then
      echo $ip
      exit
    fi
  else
      netInterface='eth0'
      get_ip
      if [ ! -z "$ip" ]; then
        if [[ $ip == *.* ]] ; then
          echo $ip
          exit
        fi
      else
          get_ip_corpo
          if [ ! -z "$ip" ]; then
            if [[ $ip == *.* ]] ; then
              echo $ip
              exit
            fi
          fi
      fi
  fi

  echo "not connected"
}

main() {
  print_ip
}

main
