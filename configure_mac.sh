#!/bin/sh

brew tap caskroom/cask
brew install brew-cask
brew cask install virtualbox
brew install ruby python python3 node git tmux vim boot2docker gettext

# Version of pip that comes with brew is outdated
pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools

npm install -g bower gulp jshint

# Symlink configurations
ln -s ~/Code/dotfiles/sublime_text/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -s ~/Code/dotfiles/sublime_text/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -s ~/Code/dotfiles/sublime_text/Default\ \(Linux\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
ln -s ~/Code/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/Code/dotfiles/.bashrc ~/.bashrc
ln -s ~/Code/dotfiles/.vimrc ~/.vimrc

# Make holding down a key work in Sublime Text vintage mode
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# Open Sublime Text from the command line
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/bin/subl

