#!/bin/sh

brew install ruby python python3 node git tmux vim

# Symlink configurations
ln -s ~/Code/dotfiles/sublime_text/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -s ~/Code/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/Code/dotfiles/.bashrc ~/.bashrc
ln -s ~/Code/dotfiles/.vimrc ~/.vimrc

# Make holding down a key work in Sublime Text vintage mode
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# Open Sublime Text from the command line
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/bin/subl

