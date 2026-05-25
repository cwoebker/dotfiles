# Interactive zsh options and history.

export HISTFILE=$XDG_STATE_HOME/zsh/history
export HISTSIZE=32768
export SAVEHIST=$HISTSIZE

# Redirect macOS Apple-zsh per-session history out of $HOME.
export SHELL_SESSIONS_DIR=$XDG_STATE_HOME/zsh/sessions

unsetopt correct_all
setopt RM_STAR_WAIT
setopt EXTENDED_HISTORY  # add timestamps to history
setopt complete_aliases  # don't expand aliases before completion finishes
