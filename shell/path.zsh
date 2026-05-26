
##### XDG Base Directory Specification #####

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export CUSTOM_APP_DIR=$HOME/.app

##### PATH #####

# dotfiles
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.bin:$PATH

##### PYTHON #####
export VIRTUAL_ENV_DISABLE_PROMPT=true

##### OCAML #####
$XDG_CONFIG_HOME/opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH=$XDG_CONFIG_HOME/opam/system/bin:$PATH

##### NODE #####

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

##### GO #####

export GOPATH=$XDG_DATA_HOME/go
export PATH=$PATH:$GOPATH/bin
