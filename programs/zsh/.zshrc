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
# Search command history with ctrl-r
bindkey "^R" history-incremental-pattern-search-backward

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
# Save timestamps and durations along with each command
setopt EXTENDED_HISTORY
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

###############################################################################
# Plugins
###############################################################################
[[ -a ~/.zsh_plugins.sh ]] && source ~/.zsh_plugins.sh
# Accept and execute the current suggestion with ctrl + space
bindkey '^ ' autosuggest-execute

###############################################################################
# Completion
# should be triggered after zsh-completions is loaded
###############################################################################
autoload -Uz compinit
compinit
