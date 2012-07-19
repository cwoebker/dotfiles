# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cwoebker" #"robbyrussell"

# Editor settings
export EDITOR=vim$EDITOR

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(cwoebker brew cloudapp django fabric gem git github heroku osx pip python rbenv redis-cli ruby textmate vagrant)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH=/opt/brew/Cellar/node/0.4.12/bin:/Users/cwoebker/.pythonbrew/bin:/Users/cwoebker/.pythonbrew/bin:/Users/cwoebker/.rbenv/shims:/opt/brew/sbin:/opt/brew/bin:/opt/hubot/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/texbin:/opt/local/bin

# PythonPath
export PYTHONPATH=/opt/brew/lib/python2.7/site-packages:$PYTHONPATH

# rbenv
eval "$(rbenv init -)"

# pythonbrew
source /Users/cwoebker/.pythonbrew/etc/bashrc

# Virtualenv Wrapper
if [ `id -u` != '0' ]; then
  export VIRTUALENV_USE_DISTRIBUTE=1        # <-- Always use pip/distribute
  export WORKON_HOME=$HOME/.virtualenvs       # <-- Where all virtualenvs will be stored
  source /usr/local/bin/virtualenvwrapper.sh
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_RESPECT_VIRTUALENV=true
fi

# brew android sdk
export ANDROID_SDK_ROOT=/opt/brew/Cellar/android-sdk/r17

# grc
source "`brew --prefix`/etc/grc.bashrc"

# Terminal 256 colors
export TERM="xterm-256color"

# Aliases

alias cs='cd ~/Dropbox/Summer\ 2012/CS107/'
alias cat='ccat'

# Custom Functions

function ccat() {
    #!/bin/zsh#
    if [ ! -t 0 ];then
            file=/dev/stdin
    elif [ -f $1 ];then
            file=$1
    else
            echo "Usage: $0 code.c"
            echo "or e.g. head code.c|$0"
    fi
    pygmentize -f terminal -g $file 
}

