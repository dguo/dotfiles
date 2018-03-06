#!/usr/bin/env bash

set -e

DOTFILES=~/Code/dguo/dotfiles

# Initial
# sudo pacman -Sy autojump cloc dbeaver docker docker-compose dropbox fzf git \
#     gnome-shell-extension-dash-to-dock gnome-tweak-tool gvim \
#     libsecret shellcheck the_silver_searcher terminator thunderbird tldr vlc
# yaourt -Sy adobe-source-code-pro-fonts google-chrome firefox-developer \
#     interception-caps2esc vim-plug visual-studio-code
# Sign into Chrome, Dropbox, and Firefox
# USe the tweak tool to configure the dock.

mkdir -p ~/Code/dguo
cd ~/Code/dguo || exit 1
if cd dotfiles; then
    git pull;
else
    git clone https://github.com/dguo/dotfiles.git
fi

sudo pacman -Syu
yaourt -Syu

# Bash
ln -sf $DOTFILES/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/.bashrc ~/.bashrc

# Git
ln -sf $DOTFILES/git/linux.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

# Remap caps lock to escape and control
sudo ln -sf $DOTFILES/configure/udevmon.yaml /etc/udevmon.yaml
sudo systemctl enable udevmon

# Docker
sudo usermod -a -G docker "$USER"
sudo systemctl enable docker

# Terminator
mkdir -p ~/.config/terminator
ln -sf $DOTFILES/terminator/config ~/.config/terminator/config

# Vim
ln -sf $DOTFILES/.vimrc ~/.vimrc
vim +PlugUpdate +qall
vim +PlugClean! +qall

# Visual Studio Code
ln -sf $DOTFILES/vscode/settings.json ~/.config/Code/User/settings.json
pwd
. $DOTFILES/vscode/sync-extensions.sh
