#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    echo Updating Mac
    ./systems/mac/mac.sh
elif [ -f /etc/os-release ]; then
    # shellcheck disable=SC1091
    source /etc/os-release

    if [ "$NAME" == "Arch Linux" ]; then
	if [ -z "$DISPLAY" ]; then
            echo Updating Arch server
            ./systems/arch/server/arch.sh
	else
            echo Updating Arch desktop
            ./systems/arch/antergos/antergos.sh
	fi
    elif [ "$NAME" == "Ubuntu" ]; then
        echo Updating Ubuntu
        ./systems/ubuntu/desktop.sh
    else
        echo Failed to detect the Linux distribution
        exit 1
    fi
else
    echo Failed to detect the OS
    exit 1
fi
