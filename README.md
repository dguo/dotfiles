# System Configuration

[![CI status](https://github.com/dguo/dotfiles/workflows/CI/badge.svg)](https://github.com/dguo/dotfiles/actions?query=branch%3Amaster)

I try to keep as much of my configuration as possible in this repo. I symlink
my [dotfiles](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory)
into the appropriate locations. I also use the scripts in the `systems`
directory to initialize new machines and keep them up to date later. The
top-level `configure.sh` script detects the current system and runs the
appropriate script.

## Remapping caps lock

The best tip I ever got for switching away from a default setting was to change
my caps lock key to function as both escape and control. On every OS, there is
a way to make caps lock work as escape when tapped and control when held down.
Check out this [blog
post](https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control/) on
how to do it.

## Terminal toolkit

* [clipboard-cli](https://github.com/sindresorhus/clipboard-cli) for a cross-platform way to access the system clipboard
* [ctop](https://ctop.sh/) for monitoring containers
* [diff2html-cli](https://diff2html.xyz/) for viewing side by side Git diffs
* [Docker](https://www.docker.com) for development environments
    * Containerization means it's much lighter than VM solutions like [Vagrant](https://www.vagrantup.com)
    * Supported by many [CI services](https://en.wikipedia.org/wiki/Comparison_of_continuous_integration_software)
* [Git](https://git-scm.com) for source control
    * I tried to do a merge in [SVN](https://subversion.apache.org) once. Never again.
* [Glances](https://nicolargo.github.io/glances/) for system monitoring
* [Neofetch](https://github.com/dylanaraps/neofetch) for system show off screenshots
* [opn-cli](https://github.com/sindresorhus/opn-cli) for opening files using the default program
* [tldr](https://tldr.sh/) for when `man` is overkill
* [tmux](https://tmux.github.io) for multiplexing
* [Tokei](https://github.com/Aaronepower/tokei) for counting code statistics
* [Vim](http://www.vim.org) and [Visual Studio Code](https://code.visualstudio.com/) for text editing
    * [vim-plug](https://github.com/junegunn/vim-plug) to manage the plugins
    * See the [.vimrc](https://github.com/dguo/dotfiles/blob/master/.vimrc) for a list of plugins
* [Z shell](http://zsh.sourceforge.net/) for the [shell](https://en.wikipedia.org/wiki/Unix_shell)

### Replacements for [Unix commands](https://en.wikipedia.org/wiki/List_of_Unix_commands)

* [bat](https://github.com/sharkdp/bat) for replacing `cat`
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
* [iTerm2](https://www.iterm2.com) for terminal emulation
* [Spectacle](https://www.spectacleapp.com) for window management

## Services

* [Todoist](https://todoist.com) for keeping track of what I need to do

---
![xkcd 1172](http://imgs.xkcd.com/comics/workflow.png)
---
![xkcd 1806](https://imgs.xkcd.com/comics/borrow_your_laptop.png )
