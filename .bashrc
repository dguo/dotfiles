###############################################################################
# Author: Danny Guo
###############################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Arch
[[ -s /usr/share/fzf-marks/fzf-marks.bash ]] && \
    source /usr/share/fzf-marks/fzf-marks.bash
[[ -s /usr/share/git/completion/git-completion.bash ]] && \
    source /usr/share/git/completion/git-completion.bash
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
    __git_complete g __git_main
fi

# Ubuntu
if [ -f /etc/bash_completion.d/git-prompt ]; then
    source /etc/bash_completion.d/git-prompt
fi
if [ -f /usr/share/bash-completion/completions/git ]; then
    source /usr/share/bash-completion/completions/git
    __git_complete g __git_main
fi

# Mac
[[ -s /usr/local/etc/fzf-marks/fzf-marks.bash ]] && \
    source /usr/local/etc/fzf-marks/fzf-marks.bash
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
fi
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
    __git_complete g __git_main
fi
if [ "$(uname)" == "Darwin" ]; then
    export CLICOLOR=1 # turns on ls colors
fi

# Termux
if [ -f "$PREFIX/etc/bash_completion.d/git-prompt.sh" ]; then
    source "$PREFIX/etc/bash_completion.d/git-prompt.sh"
fi
if [ -f "$PREFIX/etc/bash_completion.d/git-completion.bash" ]; then
    source "$PREFIX/etc/bash_completion.d/git-completion.bash"
    __git_complete g __git_main
fi

###############################################################################
# Custom prompt:
#
# <user>@<host> at <time> in <working directory> on <git branch and status>
# λ
#
# Shows an exclamation point instead of a lambda if the last command had a
# non-zero exit status.
###############################################################################
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;34m\]"
WHITE="\[\e[0;37m\]"
YELLOW="\[\e[00;33m\]"
MAGENTA="\[\e[00;35m\]"
USERNAME="\u"
SHORT_HOST="\h"
MILITARY_TIME="\t"
WORKING_DIRECTORY="\w"
LAMBDA=$'\xce\xbb'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto verbose git"
export GIT_PS1_SHOWUNTRACKEDFILES=1

if [ "$(type -t __git_ps1)" != function ]; then
    # Make it a no-op
    function __git_ps1 {
        :
    }
fi

export PS1="\n$RED$USERNAME@$SHORT_HOST$WHITE at $GREEN$MILITARY_TIME$WHITE in $BLUE$WORKING_DIRECTORY\$(__git_ps1 '$WHITE on $YELLOW%s')\n$MAGENTA\$(if [ \$? == 0 ]; then echo \$LAMBDA; else echo !; fi)$WHITE "
export PS2="$RED>$WHITE "

# vi instead of emacs
export EDITOR=vim
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
if [ "$(uname)" != "Darwin" ]; then
    alias ls="ls --color=auto"
fi
###############################################################################

###############################################################################
# cd  (have option to add 'l' to immediately do a ls)
###############################################################################
# regular change
alias c="cd"
cl() {
    cd "$1" && exa;
}
# back to previous working directory
alias c-="cd -"
alias c-l="c- && l"
# move up a directory
alias ..="cd .."
alias ..l=".. && l"
# move up several directories
alias ...="cd ../.."
alias ...l="... && l"
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
# <C-k>/<C-j> instead up/down for command history
bind '"\C-k":previous-history'
bind '"\C-j":next-history'
# Build, Ship, Run
alias d="docker"
alias dc="docker-compose"
alias dm="docker-machine"
# the stupid content tracker
alias g="git"
# replace ls with exa
alias l="exa"
# fzf-marks
alias j="jump"
# turtles all the way down
alias m="mkdir"
# print working directory
alias p="pwd"
# you better check yo self before you wreck yo self
alias r="rm -i"
# text editor of choice
alias v="vim"
###############################################################################

###############################################################################
# Fuzzy finder
# Functions are adapted from https://github.com/junegunn/fzf/wiki/Examples
###############################################################################
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Make fuzzy completion work with the vim alias
complete -F _fzf_file_completion -o default -o bashdefault v

# use ag instead of find
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
_fzf_compgen_path() {
    ag -g "" "$1"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#     - Bypass fuzzy finder if there's only one match (--select-1)
#     - Exit if there's no match (--exit-0)
fe() {
    local files
    IFS='
    '
    # If we're in a git repo, search all of the files in the repo,
    # even if we're in a subdirectory
    if git rev-parse > /dev/null 2>&1; then
        cd $(git rev-parse --show-toplevel)
        files=($(git ls-files -co --exclude-standard | \
                 fzf --query="$1" --select-1 --exit-0))
    else
        files=($(fzf --query="$1" --select-1 --exit-0))
    fi
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
    unset IFS
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
    local out file key
    if git rev-parse > /dev/null 2>&1; then
        cd $(git rev-parse --show-toplevel)
        out=$(git ls-files -co --exclude-standard | fzf --query="$1" \
              --exit-0 --expect=ctrl-o,ctrl-e)
    else
        out=$(fzf --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
    fi
    key=$(head -1 <<< "$out")
    file=$(head -2 <<< "$out" | tail -1)
    if [ -n "$file" ]; then
        [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
    fi
}

# cd to selected directory
#     - Bypass fuzzy finder if there's only one match (--select-1)
#     - "." represents the top level of a git repo
fc() {
    local dir
    if git rev-parse > /dev/null 2>&1; then
        cd $(git rev-parse --show-toplevel)
        dir=$(git ls-files -co --exclude-standard | xargs -n1 dirname | sort | \
              uniq | fzf --select-1 -q "$1")
    else
        dir=$(find ${1:-*} -path '*/\.*' -prune \
            -o -type d -print 2> /dev/null | fzf +m)
    fi
    cd "$dir"
}

# cd into the directory of the selected file
fcf() {
    local file
    local dir
    if git rev-parse > /dev/null 2>&1; then
        cd $(git rev-parse --show-toplevel)
        file=$(git ls-files -co --exclude-standard | fzf +m -q "$1" --select-1)
    else
        file=$(fzf +m -q "$1" --select-1)
    fi
    dir=$(dirname "$file")
    cd "$dir"
}
###############################################################################
