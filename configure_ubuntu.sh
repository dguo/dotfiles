#!/usr/bin/env bash

# Tested on Ubuntu 14.04

sudo add-apt-repository -y ppa:gnome-terminator

sudo apt-get -y update
sudo apt-get -y autoclean
sudo apt-get -y autoremove

sudo apt-get -y install terminator

# Command line tools
sudo apt-get -y install autojump
sudo apt-get -y install bash
sudo apt-get -y install git
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install shellcheck
sudo apt-get -y install tmux

if cd ~/.autoenv; then
    git pull
else
    git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
fi

# Java
sudo apt-get -y install default-jre

# Docker
sudo apt-get -y install apt-transport-https ca-certificate
sudo apt-get -y install linux-image-extra-"$(uname -r)"
sudo apt-get -y install apparmor
sudo apt-get -y install docker-engine

# Symlink configurations
ln -sf ~/Code/dguo/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/Code/dguo/dotfiles/.bashrc ~/.bashrc
ln -sf ~/Code/dguo/dotfiles/.vimrc ~/.vimrc
ln -sf ~/Code/dguo/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/Code/dguo/dotfiles/.gitignore ~/.gitignore
ln -sf ~/Code/dguo/dotfiles/terminator/config ~/.config/terminator/config

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
echo
echo "And don't forget to install a patched font for vim-devicons:"
echo "https://github.com/ryanoasis/nerd-fonts"
