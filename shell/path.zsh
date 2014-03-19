
##### PATH #####

# Customize to your needs...

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
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#Homebrew Gems Install
export PATH=/usr/local/opt/ruby/bin:$PATH

##### NODE #####

# NODE_PATH
export NODE_PATH=/opt/brew/lib/node_modules:$NODE_PATH
