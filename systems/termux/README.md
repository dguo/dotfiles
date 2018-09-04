# Termux

[Termux](https://termux.com/) is a terminal emulator and Linux environment for
Android.

## Configuration

Install the [app](https://play.google.com/store/apps/details?id=com.termux) and
the
[CodeBoard](https://play.google.com/store/apps/details?id=com.gazlaws.codeboard&rdid=com.gazlaws.codeboard)
keyboard.

```sh
$ pkg upgrade
$ pkg install git termux-exec
# start a new session for termux-exec
$ mkdir -p ~/code/dguo
$ cd ~/code/dguo
$ git clone https://github.com/dguo/dotfiles.git
$ cd dotfiles
$ ./configure.sh
# start a new session or source ~/.bashrc
```
