# Interactive zsh options and history.

export HISTFILE=$CUSTOM_HISTORY_DIR/zsh_history
export HISTSIZE=32768
export SAVEHIST=$HISTSIZE

unsetopt correct_all
setopt RM_STAR_WAIT
setopt EXTENDED_HISTORY  # add timestamps to history
setopt complete_aliases  # don't expand aliases before completion finishes
