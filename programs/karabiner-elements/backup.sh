#!/usr/bin/env bash

# Don't symlink the file because Karabiner won't reload it correctly.
# See https://pqrs.org/osx/karabiner/document.html#configuration-file-path

cp ~/.config/karabiner/karabiner.json .
