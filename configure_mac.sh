#!/bin/sh

# Install homebrew first!

# shells
brew install bash
# languages
brew install haskell-stack
brew install n # node version manager
n lts # latest LTS version of node
brew install python
brew install python3
brew install ruby
brew install rust
# tools
brew install autoenv
brew install autojump
brew install cloc
brew install git
brew install git-extras
brew install pandoc
brew install Caskroom/cask/mactex
brew install postgresql
brew install the_silver_searcher
brew install tmux
brew install vim
# programs
brew install caskroom/cask/brew-cask
brew cask install caskroom/versions/firefoxdeveloperedition
brew cask install dropbox
brew cask install duet
brew cask install evernote
brew cask install flux
brew cask install google-chrome
brew cask install karabiner
brew cask install lastpass
brew cask install opera
brew cask install smcfancontrol
brew cask install spectacle
brew cask install spotify
brew cask install virtualbox
brew cask install vlc

# Version of pip that comes with brew is outdated
pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools

# Global node modules
npm install -g eslint
npm install -g eslint-plugin-json
npm install -g eslint-plugin-react
npm install -g instant-markdown-d

# Symlink configurations
ln -s ~/Code/dotfiles/sublime_text/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -s ~/Code/dotfiles/sublime_text/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -s ~/Code/dotfiles/sublime_text/Default\ \(Linux\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
ln -s ~/Code/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/Code/dotfiles/.bashrc ~/.bashrc
ln -s ~/Code/dotfiles/.vimrc ~/.vimrc
# Suppress the new window message
ln -s ~/Code/dotfiles/.hushlogin ~/.hushlogin

# Make holding down a key work in Sublime Text vintage mode
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

