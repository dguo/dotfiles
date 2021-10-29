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

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
PROGRAMS_DIR="$SCRIPT_DIR/../../programs"

DOTFILES=~/code/dguo/dotfiles

hash gcc 2>/dev/null || {
    echo >&2 "Please install XCode from the App Store";
    exit 1;
}

hash brew 2>/dev/null || {
    echo >&2 "Please install homebrew: https://brew.sh";
    exit 1;
}

if [ "$(command -v zsh)" == "/bin/zsh"  ]; then
    echo >&2 "Please change the system shell to the Homebrew managed Zsh:";
    echo >&2 "See the Mac README for instructions";
    exit 1;
fi

# Install Rosetta on Apple Silicon machines that don't already have it.
# https://derflounder.wordpress.com/2020/11/17/installing-rosetta-2-on-apple-silicon-macs/
if [[ $(uname -p) == 'arm' ]]; then
    if /usr/bin/pgrep oahd >/dev/null 2>&1; then
        echo "Rosetta is already installed."
    else
        softwareupdate --install-rosetta --agree-to-license
    fi
fi

# to pick up the Brewfile
cd $DOTFILES/systems/mac

brew update
brew bundle
brew cleanup

pip3 install --upgrade pip setuptools

# Global node modules
npm install -g --no-audit --no-fund clipboard-cli diff2html-cli instant-markdown-d live-server open-cli

# Make keys repeat when held down
# https://lifehacker.com/5826055/make-your-keyboard-keys-repeat-properly-when-held-down-in-mac-os-x-lion
defaults write -g ApplePressAndHoldEnabled -bool false

# Change where screenshots are saved to (default is the desktop)
defaults write com.apple.screencapture location ~/Downloads

# Prevent a MacBook from turning on just by opening the lid
# https://www.ifixit.com/Guide/How+to+Disable+Auto+Boot/110034
sudo nvram AutoBoot=%00

# Symlink configurations
ln -sf $DOTFILES/programs/asdf/.tool-versions ~/.tool-versions
ln -sf $DOTFILES/programs/sh/.profile ~/.profile
ln -sf $DOTFILES/programs/zsh/.zshrc ~/.zshrc
ln -sf $DOTFILES/programs/git/mac.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore
mkdir -p ~/.hammerspoon
ln -sf $DOTFILES/programs/hammerspoon/init.lua ~/.hammerspoon/init.lua
ln -sf $DOTFILES/programs/tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.gnupg
if [[ $(uname -p) == 'arm' ]]; then
    ln -sf $DOTFILES/programs/gpg/gpg-agent-apple-silicon.conf ~/.gnupg/gpg-agent.conf
else
    ln -sf $DOTFILES/programs/gpg/gpg-agent-intel.conf ~/.gnupg/gpg-agent.conf
fi
# Suppress the new window message
ln -sf $DOTFILES/systems/mac/.hushlogin ~/.hushlogin

# Vim
ln -sf $DOTFILES/programs/vim/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall
vim +PlugClean +qall

# Visual Studio Code
mkdir -p ~/Library/Application\ Support/Code/User
ln -sf $DOTFILES/programs/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
source "$PROGRAMS_DIR/vscode/sync-extensions.sh"

# Zsh
antibody bundle < $DOTFILES/programs/zsh/zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update
