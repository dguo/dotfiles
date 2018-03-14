#!/usr/bin/env bash

# This is a setup script for my personal Mac. It handles both setting up a
# machine from scratch and keeping the machine up to date and clean, which means
# that it is safe to run the script at any point.
#
# For some steps, manual intervention is either required, or I prefer to keep it
# manual (like installing homebrew). However, for my future self's sake, the
# script detects these situations and provides explicit instructions for what to
# do.

hash gcc 2>/dev/null || {
    echo >&2 "Please install XCode from the App Store";
    exit 1;
}

hash brew 2>/dev/null || {
    echo >&2 "Please install homebrew: http://brew.sh";
    exit 1;
}

brew update

brew install bash
if [ "$(command -v bash)" != "/usr/local/bin/bash" ]; then
    echo >&2 "Please change the system shell to the homebrew managed bash:";
    echo >&2 "See https://johndjameson.com/blog/updating-your-shell-with-homebrew/";
    # sudo -s
    # echo /usr/local/bin/bash >> /etc/shells
    # chsh -s /usr/local/bin/bash
    exit 1;
fi

# languages
brew install haskell-stack
brew install n # node version manager
n lts # latest LTS version of node
brew install python
brew install python3
brew install ruby
brew install rust
# tools
brew install awscli
brew install cloc
brew install fzf
brew install git
brew install gpg
brew install md5sha1sum
brew install mosh
brew install pandoc
brew install pinentry-mac # for entering a GPG passphrase
brew install ripgrep
brew install shellcheck
brew install tldr
brew install tmux
brew install xsv
brew install vim
brew install yarn
# applications, using https://caskroom.github.io
brew tap caskroom/cask
brew cask install appcleaner
brew cask install android-studio
brew cask install caskroom/versions/firefoxdeveloperedition
brew cask install docker
brew cask install dropbox
brew cask install duet
brew cask install evernote
brew cask install flux
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install karabiner-elements
brew cask install lastpass
brew cask install mactex
brew cask install obs
brew cask install opera
brew cask install paintbrush
brew cask install razer-synapse
brew cask install smcfancontrol
brew cask install spectacle
brew cask install spotify
brew cask install vlc

brew cleanup

# Version of pip that comes with brew is outdated
pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools
pip install pylint

# fzf-marks
curl -fLo /usr/local/etc/fzf-marks/fzf-marks.bash --create-dirs \
    https://raw.githubusercontent.com/urbainvaes/fzf-marks/master/fzf-marks.plugin.bash

# Global node modules
npm install -g eslint
npm install -g eslint-plugin-json
npm install -g eslint-plugin-react
npm install -g eslint-plugin-import
npm install -g instant-markdown-d

# Symlink configurations
ln -sf ~/Code/dguo/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/Code/dguo/dotfiles/.bashrc ~/.bashrc
ln -sf ~/Code/dguo/dotfiles/git/mac.gitconfig ~/.gitconfig
ln -sf ~/Code/dguo/dotfiles/.gitignore ~/.gitignore
ln -sf ~/Code/dguo/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/Code/dguo/dotfiles/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -sf ~/Code/dguo/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
# Suppress the new window message
ln -sf ~/Code/dguo/dotfiles/.hushlogin ~/.hushlogin

# Vim
ln -sf ~/Code/dguo/dotfiles/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall
vim +PlugClean +qall

# Visual Studio Code
ln -sf ~/Code/dguo/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
. ~/Code/dguo/dotfiles/vscode/sync-extensions.sh
