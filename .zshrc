# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/faisal/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# auto compeletion with arrow-key
zstyle ':completion:*' menu select

# auto update autocomplete commands
zstyle ':completion:*' rehash true

# autocompletion of cli switches
setopt COMPLETE_ALIASES

autoload -Uz promptinit
promptinit

# aliases
alias sudo='sudo '
alias ls='ls --color=auto'
alias vi='nvim'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

# saftey meseaures
alias mv='timeout 8 mv -iv'
alias rm='timeout 3 rm -Iv --one-file-system'

# promt setting
PROMPT="%n@%m:%~ %# " 
#PROMPT=[%n@%m:%c]%#
#prompt redhat
#prompt suse

# fix home and ESC keys in terminal
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# fix del key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# default browser
BROWSER="google-chrome-stable"

# scale G
#export GDK_SCALE=2

# add colours to man
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
