###############################################################################
# Author: Danny Guo
# Zsh options are documented here:
# http://zsh.sourceforge.net/Doc/Release/Options.html
###############################################################################

# https://wiki.archlinux.org/index.php/environment_variables#Default_programs
export EDITOR=vim
export VISUAL=vim

# Use vi style key bindings instead of emacs
bindkey -v

# Turn on spelling correction for all arguments
setopt CORRECTALL

###############################################################################
# Prompt
###############################################################################

# Arch
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

# Mac
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
fi

# Termux
if [ -f "$PREFIX/etc/bash_completion.d/git-prompt.sh" ]; then
    source "$PREFIX/etc/bash_completion.d/git-prompt.sh"
fi

# Ubuntu
if [ -f /etc/bash_completion.d/git-prompt ]; then
    source /etc/bash_completion.d/git-prompt
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose git"

# Make __git_ps1 a no-op if it's not defined
if ! type __git_ps1 > /dev/null; then
    function __git_ps1 {
        :
    }
fi

function () {
    local username="%n"
    local short_host="%m"
    local military_time="%T"
    local working_directory="%~"
    local lambda=$'\xce\xbb'
    local newline=$'\n'
    local git_info='$(__git_ps1 " on \e[00;33m%s")'

    PS1="${newline}%F{red}$username@$short_host%F{white} at %F{green}$military_time%F{white} in %F{blue}$working_directory%F{white}${git_info}${newline}%F{magenta}%(0?.$lambda.!) %F{white}"
    PS2="%F{magenta}> %F{white}"

    # Expand the Git info in the prompt
    setopt PROMPT_SUBST
}

###############################################################################
# Changing directories
# Add 'l' to immediately do a ls
###############################################################################
# If a command is a directory, cd to it
setopt AUTO_CD
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
# ls colors
###############################################################################
# Mac
if [ "$(uname)" = "Darwin" ]; then
    export CLICOLOR=1
else
    alias ls="ls --color=auto"
fi

###############################################################################
# History
###############################################################################
HISTFILE=~/.zsh_history
# Max lines kept in a session
HISTSIZE=10000
# Max lines kept in the file
SAVEHIST=10000
# Remove duplicates before unique commands
setopt HIST_EXPIRE_DUPS_FIRST
# Don't add entires that duplicate the previous command
setopt HIST_IGNORE_DUPS
# Remove commands when the first character is a space
setopt HIST_IGNORE_SPACE
# Don't immediately execute commands from history; just fill the edit buffer
setopt HIST_VERIFY
# Share history between shells
setopt SHARE_HISTORY

###############################################################################
# Aliases
###############################################################################
# <C-k>/<C-j> instead of up/down for command history
bindkey "^k" history-beginning-search-backward
bindkey "^j" history-beginning-search-forward
# cat with syntax highlighting and Git integration
alias b="bat"
# Cross-platform clipboard access
alias cb="clipboard"
# Build, Ship, Run
alias d="docker"
alias dc="docker-compose"
alias dm="docker-machine"
# the stupid content tracker
alias g="git"
alias gd="diff2html -s side"
# a modern ls
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
# fzf
###############################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
#   - CTRL-O to open with `opn` command,
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
        [ "$key" = ctrl-o ] && opn "$file" || ${EDITOR:-vim} "$file"
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
# Plugins
###############################################################################
[[ -a ~/.zsh_plugins.sh ]] && source ~/.zsh_plugins.sh
# Accept and execute the current suggestion with ctrl + space
bindkey '^ ' autosuggest-execute
# Search command history with ctrl-r
# Override fzf-history-widget because it doesn't seem to work
bindkey "^R" history-incremental-pattern-search-backward

###############################################################################
# Completion
# should be triggered after zsh-completions is loaded
###############################################################################
autoload -Uz compinit
compinit
