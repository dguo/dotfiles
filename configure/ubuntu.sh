#!/usr/bin/env bash

# Tested on Ubuntu 14.04

sudo add-apt-repository -y ppa:gnome-terminator

sudo apt-get -y update
sudo apt-get -y autoclean
sudo apt-get -y autoremove

sudo apt-get -y install terminator

# Command line tools
sudo apt-get -y install bash
sudo apt-get -y install git
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install shellcheck
sudo apt-get -y install tmux

# Java
sudo apt-get -y install default-jre

# Docker
sudo apt-get -y install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce

# Symlink configurations
ln -sf ~/Code/dguo/dotfiles/programs/bash/.bash_profile ~/.bash_profile
ln -sf ~/Code/dguo/dotfiles/programs/bash/.bashrc ~/.bashrc
ln -sf ~/Code/dguo/dotfiles/programs/vim/.vimrc ~/.vimrc
ln -sf ~/Code/dguo/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/Code/dguo/dotfiles/.gitignore ~/.gitignore
ln -sf ~/Code/dguo/dotfiles/programs/terminator/config ~/.config/terminator/config

# Vim
sudo apt-get -y install vim
sudo apt-get install build-essential cmake # for YouCompleteMe
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Can't do the following because it's not obvious when YouCompleteMe is done
# vim +PlugInstall +qall
echo "############################################################"
echo
echo "Now open Vim and run :PlugInstall or :PlugUpdate"
