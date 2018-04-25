#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# please note: this plugin is adjusted for my laptop only right now (thinkpad t470s, Ubuntu 17.10)
# it may be improved in the future

function get_ip_wlan() {
    ip="$(ifconfig | grep broadcast | awk '{print $2}')"
}

function get_ip_eth() {
    ip="$(ifconfig | grep ether | awk '{print $2}')"
    if [[ $ip != *"."* ]]; then
        ip="not connected"
    fi
}

function print_ip() {
    get_ip_wlan
    if [ ! -z "$ip" ]; then
        echo "$ip"
        exit
    else
        get_ip_eth
        if [ ! -z "$ip" ]; then
            echo $ip
        fi
        exit
    fi

    echo "not connected"
}

main() {
  print_ip
}

main
