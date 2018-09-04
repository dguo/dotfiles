###############################################################################
# Author: Danny Guo
###############################################################################

# https://wiki.archlinux.org/index.php/environment_variables#Default_programs
export EDITOR=vim
export VISUAL=vim

# Use vi style key bindings instead of emacs
bindkey -v
# Search command history with ctrl-r
bindkey "^R" history-incremental-pattern-search-backward

# Custom prompt
function () {
    local username="%n"
    local short_host="%m"
    local military_time="%T"
    local working_directory="%~"
    local lambda=$'\xce\xbb'
    local newline=$'\n'

    PROMPT="${newline}%F{red}$username@$short_host%F{white} at %F{green}$military_time%F{white} in %F{blue}$working_directory${newline}%F{magenta}%(0?.$lambda.!) %F{white}"
}

###############################################################################
# Options
# http://zsh.sourceforge.net/Doc/Release/Options.html
###############################################################################

###############################################################################
# Changing directories
###############################################################################
# If a command is a directory, cd to it
setopt AUTO_CD

###############################################################################
# Completion
###############################################################################
autoload -Uz compinit
compinit
# Autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

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
# Plugins
###############################################################################
[[ -a ~/.zsh_plugins.sh ]] && source ~/.zsh_plugins.sh
# Accept and execute the current suggestion with ctrl + space
bindkey '^ ' autosuggest-execute
