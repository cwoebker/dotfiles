#!/usr/bin/env bash
#
# bootstrap installs things.

DOTFILES=$HOME/.dotfiles # export? "`pwd`"

set -e

info () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}
user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1\n"
}
success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}
fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

init () {
  info "Initializing git submodules..."
  git submodule init
  git submodule update
}

backup () {
  info "Backing up old configuration files..."
  mv ~/.vimrc ~/.vimrc-bak
  mv ~/.zshrc ~/.zshrc-bak
  mv ~/.vim ~/.vim-bak
  mv ~/.gitconfig ~/.gitconfig-bak
  mv ~/.gitignore ~/.gitignore-bak
  mv ~/.tmux.conf ~/.tmux.conf-bak
}

# General
install-bin () {
  info "Installing binary files..."
  chmod u+x $DOTFILES/custom/bin/*
  ln -fs $DOTFILES/custom/bin ~/.bin
}
install-shell () {
  info "Installing shell configs..."
  ln -fs $DOTFILES/shell/zshrc ~/.zshrc
  ln -fs $DOTFILES/tmux/tmux.conf ~/.tmux.conf
  ln -fs $DOTFILES/custom/tmuxinator ~/.tmuxinator
}
install-oh-my-zsh () {
  info "Installing oh-my-zsh..."
  ln -fs ../../cwoebker.zsh-theme $DOTFILES/shell/oh-my-zsh/themes/cwoebker.zsh-theme
}
install-vim () {
  info "Linking vim setup..."
  ln -fs $DOTFILES/editor/vim ~/.vim
  ln -fs $DOTFILES/editor/vim/init.vim ~/.vimrc
  ln -fs $DOTFILES/editor/vim/gui.vim ~/.gvimrc
  info "Updating vim plugins..."
  info "-----------------------"
  #git submodule foreach git pull origin master --recurse-submodules
  info "-----------------------"
}
install-atom () {
  info "Linkiung atom setup..."
  ln -fs $DOTFILES/editor/atom ~/.atom
}
install-sublime () {
  info "Linking sublime settings..."
  ln -fs $DOTFILES/editor/sublime/Preferences.sublime-settings "/Users/cwoebker/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
}
install-git () {
  info "Installing git configs..."
  ln -fs $DOTFILES/git/gitconfig ~/.gitconfig
  ln -fs $DOTFILES/git/gitignore ~/.gitignore
}
install-virtualenvwrapper () {
  info "Installing virtualenvwrapper custom hooks..."
  mkdir -p ~/.virtualenvs/
  ln -fs $DOTFILES/custom/virtualenvwrapper/* ~/.virtualenvs/
}
install-hosts () {
  info "Installing hosts file..."
  if [ $EUID == 0 ]; then
    cat $DOTFILES/custom/customhosts $DOTFILES/osx/zerohosts > /etc/hosts
  else
    user "Need sudo rights to update hosts file"
  fi
}

install () {
  info "Installing cwoebker's dotfiles..."
  info "---------------------------------"
  info " "
  install-bin
  install-shell
  install-oh-my-zsh
  install-vim
  install-atom
  install-sublime
  install-git
  #install-virtualenvwrapper
  install-hosts
  info "--------------------------------------------"
  success "Installtion of cwoebker's dotfiles complete!"
}

install
