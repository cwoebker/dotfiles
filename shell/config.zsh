# Terminal 256 colors
export TERM="xterm-256color";

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

HISTFILE=~/.zsh_history
export HISTSIZE=32768;
export SAVEHIST=$HISTSIZE;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;

export HOMEBREW_NO_ANALYTICS=1

unsetopt correct_all
setopt RM_STAR_WAIT
setopt EXTENDED_HISTORY # add timestamps to history

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases
