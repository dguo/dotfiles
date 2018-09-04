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
    (
    cd yay || exit
    makepkg -si
    )
    rm -rf yay
fi

MISSING_PACKAGES="$(comm -23 --check-order \
    <(cat $DOTFILES/systems/arch/packages.txt \
          $DOTFILES/systems/arch/server/packages.txt | sort) \
    <(yay -Qqe | sort) \
    | tr '\n' ' ')"
if [ -z "$MISSING_PACKAGES" ]; then
    echo "No missing packages to install"
else
    # shellcheck disable=SC2086
    yay -S --needed $MISSING_PACKAGES
fi

# Update all packages, and clean unneeded packages
yay -Syu
yay -Yc

# Bash
ln -sf $DOTFILES/programs/bash/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/programs/bash/.bashrc ~/.bashrc

# Git
ln -sf $DOTFILES/programs/git/arch-server.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

# Docker
sudo usermod -a -G docker "$USER"
sudo systemctl enable --now docker

# tmux
ln -sf $DOTFILES/programs/tmux/.tmux.conf ~/.tmux.conf

# Vim
ln -sf $DOTFILES/programs/vim/.vimrc ~/.vimrc
vim +PlugUpdate +qall
vim +PlugClean! +qall
