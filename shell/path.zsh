
##### XDG Base Directory Specification #####

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.data

export CUSTOM_APP_DIR=$HOME/.app
export CUSTOM_HISTORY_DIR=$HOME/.history

##### PATH #####

# dotfiles
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.bin:$PATH

##### JAVA #####
# jenv
export PATH="$HOME/.jenv/bin:$PATH"
if command -v jenv > /dev/null; then eval "$(jenv init -)"; fi

##### PYTHON #####
# pyenv
export PYENV_ROOT=~/.app/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv > /dev/null; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
export VIRTUAL_ENV_DISABLE_PROMPT=true

##### RUBY #####
# rbenv
export RBENV_ROOT=~/.app/rbenv
if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi

##### OCAML #####
$XDG_CONFIG_HOME/opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH=$XDG_CONFIG_HOME/opam/system/bin:$PATH

##### NODE #####

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NODENV_ROOT=~/.app/nodenv
if command -v nodenv > /dev/null; then eval "$(nodenv init -)"; fi

##### GO #####

export GOPATH=$XDG_DATA_HOME/go
export PATH=$PATH:$GOPATH/bin
