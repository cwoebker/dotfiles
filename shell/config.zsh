
export LC_ALL="en_US.UTF-8"
export EDITOR=vim

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
# Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
# Add forward-char widgets to PARTIAL_ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)

# Terminal 256 colors
export TERM="xterm-256color";

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

export HISTFILE=$CUSTOM_HISTORY_DIR/zsh_history
export HISTSIZE=32768;
export SAVEHIST=$HISTSIZE;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

unsetopt correct_all
setopt RM_STAR_WAIT
setopt EXTENDED_HISTORY # add timestamps to history

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases
