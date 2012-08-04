#!/usr/bin/env bash

echo "initializing submodules"
git submodule init
git submodule update

echo "Deleting the old files"
mv ~/.vimrc ~/.vimrc-bak
mv ~/.zshrc ~/.zshrc-bak
mv ~/.vim ~/.vim-bak
mv ~/.gvimrc ~/.gvimrc-bak
mv ~/.gitconfig ~/.gitconfig-bak
mv ~/.gitignore ~/.gitignore-bak
mv ~/.tmux.conf ~/.tmux.conf-bak

echo "Symlinking files"
ln -s ~/Dropbox/Code/dotfiles/vimrc ~/.vimrc
ln -s ~/Dropbox/Code/dotfiles/zshrc ~/.zshrc
ln -s ~/Dropbox/Code/dotfiles/vim ~/.vim
ln -s ~/Dropbox/Code/dotfiles/gvimrc ~/.gvimrc
ln -s ~/Dropbox/Code/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Dropbox/Code/dotfiles/gitignore ~/.gitignore
ln -s ~/Dropbox/Code/dotfiles/tmux ~/.tmux.conf
ln -s ~/Dropbox/Code/dotfiles/cwoebker.zsh-theme ~/.oh-my-zsh/themes/cwoebker.zsh-theme 

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "All done."

