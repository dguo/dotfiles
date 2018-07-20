#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    echo Updating Mac
    ./configure/mac.sh
elif [ -f /etc/os-release ]; then
    . /etc/os-release

    if [ "$NAME" == "Arch Linux" ]; then
	if [ -z "$DISPLAY" ]; then
            echo Updating Arch server
            ./configure/arch.sh
	else
            echo Updating Arch desktop
            ./configure/antergos.sh
	fi
    elif [ "$NAME" == "Ubuntu" ]; then
        echo Updating Ubuntu
        ./configure/ubuntu.sh
    else
        echo Failed to detect the Linux distribution
        exit 1
    fi
else
    echo Failed to detect the OS
    exit 1
fi
