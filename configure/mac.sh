#!/usr/bin/env bash

# This is a setup script for my personal Mac. It handles both setting up a
# machine from scratch and keeping the machine up to date and clean, which means
# that it is safe to run the script at any point.
#
# For some steps, manual intervention is either required, or I prefer to keep it
# manual (like installing homebrew). However, for my future self's sake, the
# script detects these situations and provides explicit instructions for what to
# do.

# Exit immediately if any command fails
set -e

DOTFILES=~/Code/dguo/dotfiles


hash gcc 2>/dev/null || {
    echo >&2 "Please install XCode from the App Store";
    exit 1;
}

hash brew 2>/dev/null || {
    echo >&2 "Please install homebrew: http://brew.sh";
    exit 1;
}

if [ "$(command -v bash)" != "/usr/local/bin/bash" ]; then
    echo >&2 "Please change the system shell to the homebrew managed bash:";
    echo >&2 "See https://johndjameson.com/blog/updating-your-shell-with-homebrew/";
    # brew install bash
    # sudo -s
    # echo /usr/local/bin/bash >> /etc/shells
    # chsh -s /usr/local/bin/bash
    exit 1;
fi

# to pick up the Brewfile
cd $DOTFILES/configure

brew update
brew bundle
brew cleanup

pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools

# fzf-marks
curl -fLo /usr/local/etc/fzf-marks/fzf-marks.bash --create-dirs \
    https://raw.githubusercontent.com/urbainvaes/fzf-marks/master/fzf-marks.plugin.bash

# Global node modules
npm install -g eslint \
               eslint-plugin-json \
               eslint-plugin-react \
               eslint-plugin-import \
               instant-markdown-d \
               opn-cli

# Symlink configurations
ln -sf $DOTFILES/.bash_profile ~/.bash_profile
ln -sf $DOTFILES/.bashrc ~/.bashrc
ln -sf $DOTFILES/git/mac.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore
ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -sf $DOTFILES/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
# Suppress the new window message
ln -sf $DOTFILES/.hushlogin ~/.hushlogin

# Vim
ln -sf $DOTFILES/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall
vim +PlugClean +qall

# Visual Studio Code
ln -sf $DOTFILES/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
. $DOTFILES/vscode/sync-extensions.sh
