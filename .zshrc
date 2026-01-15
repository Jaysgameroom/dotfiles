HISTFILE=~/$XDG_CACHE_HOME/zsh_history
HISTSIZE=10000
SAVEHIST=10000


setopt autocd beep extendedglob nomatch notify
bindkey -v

autoload -Uz compinit
compinit

alias ls='ls --color=auto'

export PROMPT="%@::%B%F{green}%n@%m%f%b > %~ %# "

autoload -Uz tetriscurses

