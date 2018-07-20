#!/usr/bin/env bash

set -e

DOTFILES=~/Code/dguo/dotfiles

mkdir -p ~/Code/dguo
cd ~/Code/dguo || exit 1
if cd dotfiles; then
    git pull;
else
    git clone https://github.com/dguo/dotfiles.git
fi

if ! [ -x "$(command -v yay)" ]; then
    sudo pacman -S base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

MISSING_PACKAGES="$(comm -23 --check-order \
    <(cat $DOTFILES/configure/arch-packages.txt \
          $DOTFILES/configure/arch-server-packages.txt | sort) \
    <(yay -Qqe | sort) \
    | tr '\n' ' ')"
if [ -z "$MISSING_PACKAGES" ]; then
    echo "No missing packages to install"
else
    yay -S --needed $MISSING_PACKAGES
fi

# Update all packages, and clean unneeded packages
yay -Syu
yay -Yc

# Bash
ln -sf $DOTFILES/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/.bashrc ~/.bashrc

# Git
ln -sf $DOTFILES/git/linux.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

# Docker
sudo usermod -a -G docker "$USER"
sudo systemctl enable --now docker

# Vim
ln -sf $DOTFILES/.vimrc ~/.vimrc
vim +PlugUpdate +qall
vim +PlugClean! +qall
