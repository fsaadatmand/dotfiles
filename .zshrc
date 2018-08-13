# if non-interactive, then do nothing.
if [[ ! -o interactive ]]; then
   return
fi

# history settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# vi mode
bindkey -v

# compinstall
zstyle :compinstall filename '/home/faisal/.zshrc'

autoload -Uz compinit
compinit

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

# fix home and ESC keys in terminal
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# fix del key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# set window title
case $TERM in
    st|st-256color|*xterm*|tmux|tmux-256color|(dt|k|E)term)
    precmd () {
      print -Pn "\e]0;%~ %#\a"
    } 
    preexec () { print -Pn "\e]0;%~ %# $1\a" }
    ;;
esac

# FZF - fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/fzf/key-bindings.zsh && source /usr/share/fzf/completion.zsh

# variables 
EDITOR="/usr/bin/nvim"
BROWSER="google-chrome-stable"

# promt setting
PROMPT="%n@%m:%~ %# " 

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
