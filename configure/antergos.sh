#!/usr/bin/env bash

set -e

DOTFILES=~/Code/dguo/dotfiles

# Initial
# sudo pacman -Sy adobe-source-han-sans-cn-fonts dbeaver docker \
#     docker-compose dropbox exa fd fzf git glances \
#     gnome-shell-extension-dash-to-dock gnome-tweak-tool gvim htop jq \
#     libsecret obs-studio ripgrep shellcheck terminator \
#     thunderbird tldr tokei vlc yarn
# yaourt -Sy adobe-source-code-pro-fonts ctop \
#     gnome-shell-extension-no-title-bar-git \
#     google-chrome firefox-developer fzf-marks-git \
#     interception-caps2esc vim-plug visual-studio-code-bin
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
# Remove orphans and their configuration files
if pacman -Qtdq; then
    sudo pacman -Rns "$(pacman -Qtdq)"
fi

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
sudo npm install -g instant-markdown-d opn-cli
ln -sf $DOTFILES/.vimrc ~/.vimrc
vim +PlugUpdate +qall
vim +PlugClean! +qall

# Visual Studio Code
ln -sf $DOTFILES/vscode/settings.json ~/.config/Code/User/settings.json
. $DOTFILES/vscode/sync-extensions.sh
