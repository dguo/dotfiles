#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    ./configure/mac.sh
elif [ -f /etc/os-release ]; then
    . /etc/os-release

    if [ "$NAME" == "Arch Linux" ]; then
        echo Updating Arch
        ./configure/antergos.sh
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
