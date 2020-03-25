#!/usr/bin/env bash

set -u

IP=$1
USERNAME=$2
OS=$(uname -s)

case $OS in
    'Darwin')
        sed -i "" "s|IP_ADDRESS|${IP}|" ./inventory
        sed -i "" "s|USER|${USERNAME}|" ./inventory
        ;;
    'Linux')
        sed -i "s|IP_ADDRESS|${IP}|" ./inventory
        sed -i "s|USER|${USERNAME}|" ./inventory
        ;;
    *)
        echo "OS not supported"
        ;;
esac