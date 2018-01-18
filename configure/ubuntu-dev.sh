#!/usr/bin/env bash

DOTFILES=~/code/dguo/dotfiles

# Bash
ln -sf $DOTFILES/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/.bashrc ~/.bashrc

# Git
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y
ln -sf $DOTFILES/git/ubuntu-dev.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

# Tools
sudo apt-get install autojump -y
sudo apt-get install mosh -y
ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf

# Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $DOTFILES/.vimrc ~/.vimrc
vim +PlugUpdate +qall
vim +PlugClean! +qall

