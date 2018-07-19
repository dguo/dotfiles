# System Configuration [![Build Status](https://travis-ci.org/dguo/dotfiles.svg?branch=travis)](https://travis-ci.org/dguo/dotfiles)

I try to keep as much of my configuration as possible in this repo. I symlink
my dotfiles into the appropriate locations. I also use the scripts in the
`configure` directory to initialize new machines and keep them up to date
later.

## Remapping caps lock

The best tip I ever got for switching away from a default setting was to change
my caps lock key to function as both escape and control. On every OS, there is
a way to make caps lock work as escape when tapped and control when held down.
Check out this [blog
post](https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control/) on
how to do it.

## Terminal toolkit

* [Bash](https://www.gnu.org/software/bash/) for the shell
    * The benefits of [zsh](http://www.zsh.org) seem to be somewhat negated by some of these other tools
* [ctop](https://ctop.sh/) for monitoring containers
* [Docker](https://www.docker.com) for development environments
    * Containerization means it's much lighter than VM solutions like [Vagrant](https://www.vagrantup.com)
    * Supported by many [CI services](https://en.wikipedia.org/wiki/Comparison_of_continuous_integration_software)
* [Git](https://git-scm.com) for source control
    * I tried to do a merge in [SVN](https://subversion.apache.org) once. Never again.
* [Glances](https://nicolargo.github.io/glances/) for system monitoring
* [opn](https://github.com/sindresorhus/opn-cli) for opening files using the default program
* [tldr](https://tldr.sh/) for when `man` is overkill
* [tmux](https://tmux.github.io) for multiplexing
* [Tokei](https://github.com/Aaronepower/tokei) for counting code statistics
* [Vim](http://www.vim.org) and [Visual Studio Code](https://code.visualstudio.com/) for text editing
    * [vim-plug](https://github.com/junegunn/vim-plug) to manage the plugins
    * See the [.vimrc](https://github.com/dguo/dotfiles/blob/master/.vimrc) for a list of plugins

### Replacements for [Unix commands](https://en.wikipedia.org/wiki/List_of_Unix_commands)

* [exa](https://the.exa.website/) for replacing `ls`
* [fd](https://github.com/sharkdp/fd) for replacing `find`
* [fzf](https://github.com/junegunn/fzf) for a general purpose fuzzy finder
    * Jump to directories (making `cd` somewhat obsolete) with [fzf-marks](https://github.com/urbainvaes/fzf-marks)
    * Open files without navigating to the directory
* [htop](https://hisham.hm/htop/) for replacing `top`
* [ripgrep](https://github.com/BurntSushi/ripgrep) for replacing `grep`
    * The [announcement blog post](https://blog.burntsushi.net/ripgrep/) is a great read

### Structured text processing

These are the ones I keep installed, but you can reference [this
list](https://github.com/dbohdan/structured-text-tools), which is much more
comprehensive.

* [jq](https://stedolan.github.io/jq/) for [JSON](https://en.wikipedia.org/wiki/JSON)
* [xsv](https://github.com/BurntSushi/xsv) for [CSV](https://en.wikipedia.org/wiki/Comma-separated_values)


## Languages

* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) / [TypeScript](https://www.typescriptlang.org/) / [Node](https://nodejs.org/)
    * I'm excited about [WebAssembly](https://webassembly.org/) though
* [Python](https://www.python.org)
    *  Just plain fun
* [Rust](https://www.rust-lang.org/)
    * Need more project ideas
* [Go](https://golang.org)
    * On the to learn list, especially ever since I read Rob Pike's [Less is exponentially more](https://commandcenter.blogspot.com/2012/06/less-is-exponentially-more.html)
* [Haskell](https://www.haskell.org)
    * Also on the to learn list

## Desktop applications

### Cross platform

* [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/)
* [Google Chrome](https://www.google.com/chrome/index.html)
* [VLC](http://www.videolan.org/vlc/index.html) for playing any video that I can throw at it

### Linux

* [Terminator](https://gnometerminator.blogspot.com/p/introduction.html) for terminal emulation

### Mac

* [Duet Display](http://www.duetdisplay.com) to use an iPad as another display
* [f.lux](https://justgetflux.com/) for controlling blue light at night
* [iTerm2](https://www.iterm2.com) for terminal emulation
* [Karabiner](https://github.com/tekezo/Karabiner) for key remapping
* [smcFanControl](https://github.com/hholtmann/smcFanControl) to keep things cool
* [Spectacle](https://www.spectacleapp.com) for window management

## Services

* [Evernote](https://evernote.com) for notes
* [Todoist](https://todoist.com) for keeping track of what I need to do

---
![xkcd 1172](http://imgs.xkcd.com/comics/workflow.png)
---
![xkcd 1806](https://imgs.xkcd.com/comics/borrow_your_laptop.png )
