#!/usr/bin/env bash

DOTFILES=~/Code/dguo/dotfiles

# Initial
# sudo pacman -Sy autojump git docker docker-compose dropbox fzf gvim \
#     libsecret the_silver_searcher vlc
# yaourt -Sy adobe-source-code-pro-fonts google-chrome firefox-developer \
#     vim-plug visual-studio-code
# Sign into Dropbox and Firefox

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
ln -sf $DOTFILES/git/linux.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

# Docker
sudo usermod -a -G docker "$USER"
sudo systemctl enable docker

# Vim
ln -sf $DOTFILES/.vimrc ~/.vimrc
vim +PlugUpdate +qall
vim +PlugClean! +qall

# Visual Studio Code
ln -sf $DOTFILES/vscode/settings.json ~/.config/Code/User/settings.json
pwd
. $DOTFILES/vscode/sync-extensions.sh
