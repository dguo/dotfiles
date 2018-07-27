#!/usr/bin/env bash

set -e

DOTFILES=~/code/dguo/dotfiles

pkg upgrade

# Create storage symlinks. See https://termux.com/storage.html
termux-setup-storage

ln -sf $DOTFILES/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/.bashrc ~/.bashrc

ln -sf $DOTFILES/git/termux.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf

ln -sf $DOTFILES/.vimrc ~/.vimrc

curl -o "$PREFIX/etc/bash_completion.d/git-prompt.sh" \
	https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# Set the font and color scheme
curl -Lo ~/.termux/font.ttf --create-dirs \
    https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/fonts/Source-Code-Pro.ttf
curl -Lo ~/.termux/colors.properties --create-dirs \
    https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/colors/gruvbox-dark.properties
termux-reload-settings

# Install tldr
curl -Lo "$PREFIX/bin/tldr" \
    https://gitlab.com/pepa65/tldr-bash-client/raw/master/tldr
chmod +x "$PREFIX/bin/tldr"

# Install vim-plug
curl -Lo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
