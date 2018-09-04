#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Add new extensions
while read -r extension; do code --install-extension "$extension"; done < \
    "$SCRIPT_DIR/extensions.txt"

# Remove old extensions
comm -13 <(sort "$SCRIPT_DIR/extensions.txt") \
    <(code --list-extensions | sort) | \
    while read -r extension; do code --uninstall-extension "$extension"; done
