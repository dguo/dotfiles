if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

