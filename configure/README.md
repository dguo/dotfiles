# Configure Scripts

## Termux

Install [Termux](https://play.google.com/store/apps/details?id=com.termux) and
the
[CodeBoard](https://play.google.com/store/apps/details?id=com.gazlaws.codeboard&rdid=com.gazlaws.codeboard)
keyboard.

```bash
$ pkg upgrade
$ pkg install git termux-exec
# start a new session for termux-exec
$ mkdir -p ~/code/dguo
$ cd ~/code/dguo
$ git clone https://github.com/dguo/dotfiles.git
$ cd dotfiles
$ ./configure.sh
```
