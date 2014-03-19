# Terminal 256 colors
export TERM="xterm-256color"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

unsetopt correct_all

setopt EXTENDED_HISTORY # add timestamps to history

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases
