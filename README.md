# System Configuration [![Build Status](https://travis-ci.org/dguo/dotfiles.svg?branch=travis)](https://travis-ci.org/dguo/dotfiles)

## Terminal toolkit
* [Bash](https://www.gnu.org/software/bash/) for the shell
    * The benefits of [zsh](http://www.zsh.org) seem to be somewhat negated by some of these other tools
* [Docker](https://www.docker.com) for development environments
    * Containerization means it's much lighter than VM solutions like [Vagrant](https://www.vagrantup.com)
    * Supported by many [CI services](https://en.wikipedia.org/wiki/Comparison_of_continuous_integration_software)
* [exa](https://the.exa.website/) for replacing `ls`
* [fd](https://github.com/sharkdp/fd) for replacing `find`
* [fzf](https://github.com/junegunn/fzf) for a general purpose fuzzy finder
    * Jump to directories (making `cd` somewhat obsolete) with [fzf-marks](https://github.com/urbainvaes/fzf-marks)
    * Open files without navigating to the directory
* [Git](https://git-scm.com) for source control
    * I tried to do a merge in [SVN](https://subversion.apache.org) once. Never again.
* [ripgrep](https://github.com/BurntSushi/ripgrep) for searching through code
* [tmux](https://tmux.github.io) for multiplexing
    * Except on my local machine because iTerm is powerful enough
* [Tokei](https://github.com/Aaronepower/tokei) for counting code statistics
* [Vim](http://www.vim.org) and [Visual Studio Code](https://code.visualstudio.com/) for text editing
    * [vim-plug](https://github.com/junegunn/vim-plug) to manage the plugins
    * See the [.vimrc](https://github.com/dguo/dotfiles/blob/master/.vimrc) for a list of plugins

## Languages
* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) / [Node](https://nodejs.org/)
    * Looking forward to [WebAssembly](https://webassembly.github.io) though
* [Python](https://www.python.org)
    *  Just plain fun
* [Rust](https://www.rust-lang.org/)
    * Need more project ideas
* [Go](https://golang.org)
    * On the to learn list, especially ever since I read Rob Pike's [Less is exponentially more](https://commandcenter.blogspot.com/2012/06/less-is-exponentially-more.html)
* [Haskell](https://www.haskell.org)
    * Also on the to learn list

## Desktop applications
* [Duet Display](http://www.duetdisplay.com) to use an iPad as another display
* [Evernote](https://evernote.com) for notes
* [iTerm2](https://www.iterm2.com) for terminal emulation
* [Karabiner](https://github.com/tekezo/Karabiner) for key remapping
* [smcFanControl](https://github.com/hholtmann/smcFanControl) to keep things cool
* [Spectacle](https://www.spectacleapp.com) for window management
* [VLC](http://www.videolan.org/vlc/index.html) for playing any video that I can throw at it

---
![xkcd 1172](http://imgs.xkcd.com/comics/workflow.png)
