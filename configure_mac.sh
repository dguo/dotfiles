#!/bin/sh

# Install homebrew first! http://brew.sh

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
brew install awscli
brew install cloc
brew install fzf
brew install git
brew install git-extras
brew install pandoc
brew install Caskroom/cask/mactex
brew install postgresql
brew install shellcheck
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
ln -s ~/Code/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/Code/dotfiles/.bashrc ~/.bashrc
ln -s ~/Code/dotfiles/.vimrc ~/.vimrc
ln -s ~/Code/dotfiles/.gitconfig ~/.gitconfig
# Suppress the new window message
ln -s ~/Code/dotfiles/.hushlogin ~/.hushlogin

# Set up Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

