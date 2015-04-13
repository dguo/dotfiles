###############################################################################
# Author: Danny Guo
###############################################################################

# custom prompt:
# user@host[time]:pwd (branch)
# $ 
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;34m\]"
WHITE="\[\e[0;37m\]"
GREY="\[\e[0m\]"
YELLOW="\[\e[00;33m\]"
USERNAME="\u"
SHORT_HOST="\h"
MILITARY_TIME="\t"
SHORT_PWD="\W"
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto verbose git"
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1="\n$RED$USERNAME@$SHORT_HOST$GREEN[$MILITARY_TIME]$BLUE:$SHORT_PWD$YELLOW\$(__git_ps1 ' (%s)')\n$WHITE\$ $GREY"

# vi instead of emacs
set -o vi

###############################################################################
# history
###############################################################################
# command history entries should have timestamps
export HISTTIMEFORMAT="%h %d %y %H:%M:%S "
# num commands stored in memory for current session
export HISTSIZE=10000
# num commands stored in history .bash_history
export HISTFILESIZE=10000
# append command to .bash_history rather than overwrite it at end of session
shopt -s histappend
# save each command immediately after execution rather than at end of session
PROMPT_COMMAND="history -a"
# multi-line command uses single history entry
shopt -s cmdhist
###############################################################################

###############################################################################
# readline
###############################################################################
# tab for autocomplete should not be case-sensitive
bind "set completion-ignore-case on"
# no need to hit tab twice when there's more than one match
bind "set show-all-if-ambiguous on"
###############################################################################

###############################################################################
# ls            
###############################################################################
alias ls="ls -G"
alias l="ls"
alias la="l -a"
alias ll="l -lh"
alias lal="l -lah"
###############################################################################

###############################################################################
# cd  (have option to add 'l' to immediately do a ls)
###############################################################################
# regular change
alias c="cd"
cl() {
    cd "$1" && ls;
}
# back to previous working directory
alias c-="cd -"
alias c-l="c- && ls"
# move up a directory
alias c.="cd ../"
alias c.l="c. && ls"
# move up several directories
alias c2="c1; c1"
alias c2l="c2 && ls"
alias c3="c2; c1"
alias c3l="c3 && ls"
alias c4="c3; c1"
alias c4l="c4 && ls"
alias c5="c4; c1"
alias c5l="c5 && ls"
###############################################################################

###############################################################################
# less
###############################################################################
alias less="less -N"
# Disable alias
alias lessr="\less"
###############################################################################

###############################################################################
# single character changes
###############################################################################
# a for again; run last command
alias a="fc -s"
# <C-k>/<C-j> instead up/down for command history
bind '"\C-k":previous-history'
bind '"\C-j":next-history'
# print working directory
alias p="pwd"
# safe delete
alias r="rm -i"
# text editors
alias v="vim"
alias s="subl"

