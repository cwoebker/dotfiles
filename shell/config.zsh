# Interactive zsh options and history.

export HISTFILE=$XDG_STATE_HOME/zsh/history
export HISTSIZE=32768
export SAVEHIST=$HISTSIZE

unsetopt correct_all
setopt RM_STAR_WAIT
setopt EXTENDED_HISTORY  # add timestamps to history
setopt complete_aliases  # don't expand aliases before completion finishes
