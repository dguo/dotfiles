#!/usr/bin/env bash

set -e

DOTFILES=~/code/dguo/dotfiles

pkg upgrade

ln -sf $DOTFILES/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/.bashrc ~/.bashrc

ln -sf $DOTFILES/git/termux.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

wget -O $PREFIX/etc/bash_completion.d/git-prompt.sh \
	https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
