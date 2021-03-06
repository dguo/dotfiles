#!/usr/bin/env bash

set -e

DOTFILES=~/Code/dguo/dotfiles

# Initial setup
# Sign into Chrome, Dropbox, and Firefox.
# USe the tweak tool to configure the dock.

mkdir -p ~/Code/dguo
cd ~/Code/dguo || exit 1
if cd dotfiles; then
    git pull;
else
    git clone https://github.com/dguo/dotfiles.git
fi

# Update the keyring first to prevent unknown trust errors
# https://nanxiao.me/en/update-keyring-first-if-your-arch-linux-is-old-enough/
yay -Sy --needed archlinux-keyring

MISSING_PACKAGES="$(comm -23 --check-order \
    <(cat $DOTFILES/systems/arch/packages.txt \
          $DOTFILES/systems/arch/antergos/packages.txt | sort) \
    <(yay -Qqe | sort) \
    | tr '\n' ' ')"
if [ -z "$MISSING_PACKAGES" ]; then
    echo "No missing packages to install"
else
    # shellcheck disable=SC2086
    yay -S --needed $MISSING_PACKAGES
fi

# For some reason, libsecret doesn't show up as explicitly-installed unless we
# set it.
yay -D --asexplicit libsecret

# Update all packages
yay -Syu
# Clean unneeded packages
yay -Yc

# Bash
ln -sf $DOTFILES/programs/bash/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/programs/bash/.bashrc ~/.bashrc

# Git
ln -sf $DOTFILES/programs/git/linux.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

# Remap caps lock to escape and control
sudo ln -sf $DOTFILES/systems/arch/antergos/udevmon.yaml /etc/udevmon.yaml
sudo systemctl enable udevmon

# Docker
sudo usermod -a -G docker "$USER"
sudo systemctl enable docker

# Terminator
mkdir -p ~/.config/terminator
ln -sf $DOTFILES/programs/terminator/config ~/.config/terminator/config

# Vim
sudo npm install -g instant-markdown-d opn-cli
ln -sf $DOTFILES/programs/vim/.vimrc ~/.vimrc
vim +PlugUpdate +qall
vim +PlugClean! +qall

# Visual Studio Code
ln -sf $DOTFILES/programs/vscode/settings.json ~/.config/Code/User/settings.json
. $DOTFILES/programs/vscode/sync-extensions.sh
