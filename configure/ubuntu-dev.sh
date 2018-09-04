#!/usr/bin/env bash

DOTFILES=~/code/dguo/dotfiles

# Bash
ln -sf $DOTFILES/programs/bash/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/programs/bash/.bashrc ~/.bashrc

# Git
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y
ln -sf $DOTFILES/git/ubuntu-dev.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

# Tools
sudo apt-get install mosh -y
ln -sf $DOTFILES/programs/tmux/.tmux.conf ~/.tmux.conf

# Vim
sudo apt-get install cmake python-dev -y # for YouCompleteMe
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $DOTFILES/programs/vim/.vimrc ~/.vimrc
vim +PlugUpdate +qall
vim +PlugClean! +qall
