HISTFILE=$XDG_CACHE_HOME/zsh/zsh_history HISTSIZE=10000
SAVEHIST=10000


setopt autocd beep extendedglob nomatch notify
bindkey -v

autoload -Uz compinit
compinit

alias ls='ls --color=auto'
alias wgup='wg-quick up /etc/wireguard/jojo-US-FREE-68.conf'
alias wgdown='wg-quick down /etc/wireguard/jojo-US-FREE-68.conf'



export EDITOR="nvim"
export PROMPT="%@::%B%F{green}%n@%m%f%b > %~ %# "
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"


autoload -Uz tetriscurses

