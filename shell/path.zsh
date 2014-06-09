
##### PATH #####

# Customize to your needs...

#Homebrew Gems Install
export PATH=/usr/local/opt/ruby/bin:$PATH

# homebrew priority
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# dotfiles
export PATH=$HOME/.bin:$PATH

##### PYTHON #####

# pyenv
export PYENV_ROOT=/usr/local/opt/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# PIP & Virtualenv
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=true

##### RUBY #####

# rbenv
export RBENV_ROOT=/usr/local/opt/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

##### NODE #####

# NODE_PATH
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

##### GO ######

export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

