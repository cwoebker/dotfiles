
##### PATH #####

##### XDG Base Directory Specification #####

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.data
#export XDG_RUNTIME_DIR=$HOME/.run

export CUSTOM_APP_DIR=$HOME/.app
export CUSTOM_HISTORY_DIR=$HOME/.history

# homebrew priority
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# homebrew casks
export HOMEBREW_CASK_OPTS="--appdir=/Applications/Casks"

# dotfiles
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.bin:$PATH

##### JAVA #####
# jenv
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

##### PYTHON #####
# pyenv
export PYENV_ROOT=~/.app/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# PIP & Virtualenv
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=true
# poetry
export PATH="$HOME/.poetry/bin:$PATH"

##### RUBY #####
export PATH=/usr/local/opt/ruby/bin:$PATH
# rbenv
export RBENV_ROOT=~/.app/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

##### OCAML #####
$XDG_CONFIG_HOME/opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH=$XDG_CONFIG_HOME/opam/system/bin:$PATH

##### NODE #####

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NODENV_ROOT=~/.app/nodenv
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

##### GO #####

export GOPATH=$XDG_DATA_HOME/go
export PATH=$PATH:$GOPATH/bin

##### Android #####

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk

export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$PATH
export PATH=$ANDROID_SDK_ROOT/emulator:$PATH
