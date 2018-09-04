#!/usr/bin/env bash

set -e

DOTFILES=~/code/dguo/dotfiles

pkg upgrade

pkg install bash-completion \
            cmake \
            curl \
            fzf \
            git \
            golang \
            htop \
            jq \
            libgit2-dev \
            nodejs \
            openssl-dev \
            python \
            ruby \
            tmux \
            vim-python \
            wget

wget https://its-pointless.github.io/setup-pointless-repo.sh
bash setup-pointless-repo.sh
rm setup-pointless-repo.sh pointless.gpg

pkg install cargo exa rustc ripgrep

ln -sf $DOTFILES/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/.bashrc ~/.bashrc

ln -sf $DOTFILES/git/termux.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore

ln -sf $DOTFILES/programs/tmux/.tmux.conf ~/.tmux.conf

ln -sf $DOTFILES/programs/vim/.vimrc ~/.vimrc

curl -o "$PREFIX/etc/bash_completion.d/git-prompt.sh" \
	https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# Set the font and color scheme
curl -Lo ~/.termux/font.ttf --create-dirs \
    https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/fonts/Source-Code-Pro.ttf
curl -Lo ~/.termux/colors.properties --create-dirs \
    https://raw.githubusercontent.com/dguo/blood-moon/master/applications/termux/blood-moon.properties
termux-reload-settings

# Install tldr
curl -Lo "$PREFIX/bin/tldr" \
    https://gitlab.com/pepa65/tldr-bash-client/raw/master/tldr
chmod +x "$PREFIX/bin/tldr"

# Install vim-plug
curl -Lo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall
vim +PlugClean +qall

# Create storage symlinks. See https://termux.com/storage.html
termux-setup-storage
