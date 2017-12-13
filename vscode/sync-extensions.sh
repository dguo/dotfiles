#!/usr/bin/env bash

# Add new extensions
while read -r extension; do code --install-extension "$extension"; done < \
    ~/Code/dguo/dotfiles/vscode/extensions.txt
# Remove old extensions
comm -13 <(sort ~/Code/dguo/dotfiles/vscode/extensions.txt) \
    <(code --list-extensions | sort) | \
    while read -r extension; do code --uninstall-extension "$extension"; done
