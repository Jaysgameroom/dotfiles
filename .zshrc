HISTFILE=~/$XDG_CACHE_HOME/zsh_history
HISTSIZE=10000
SAVEHIST=10000


setopt autocd beep extendedglob nomatch notify
bindkey -v

autoload -Uz compinit
compinit

alias ls='ls --color=auto'

export PS1="%n@%m > %~ "

autoload -Uz tetriscurses

