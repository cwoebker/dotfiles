install: install-bin install-shell install-vim install-git \
			install-virtualenvwrapper install-python \
			install-finish

# Manage

clean:

init:
	@echo "Initializing git submodules..."
	@git submodule init
	@git submodule update

backup:
	@echo "Backing up old configuration files..."
	@mv ~/.vimrc ~/.vimrc-bak
	@mv ~/.zshrc ~/.zshrc-bak
	@mv ~/.vim ~/.vim-bak
	@mv ~/.gitconfig ~/.gitconfig-bak
	@mv ~/.gitignore ~/.gitignore-bak
	@mv ~/.tmux.conf ~/.tmux.conf-bak

# Fixes

permissions:
	chmod u+x bin/*

# Extras

#install-subl:
#	@echo "Installing sublimetext2 binary..."
#ifeq ($(shell uname),Darwin)
#	@sudo ln -fs "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
#endif

# General

init-install:
	@echo "Installing cwoebker's dotfiles..."
	@echo "---------------------------------"
	@echo " "

install-bin:
	@echo "Installing binary files..."
	@ln -fs `pwd`/bin ~/.bin

install-shell:
	@echo "Installing shell configs..."
	@ln -fs `pwd`/shell/zshrc ~/.zshrc
	@ln -fs `pwd`/shell/vimrc ~/.vimrc
	@ln -fs `pwd`/shell/tmux ~/.tmux.conf
	@ln -fs `pwd`/shell/cwoebker.zsh-theme ~/.oh-my-zsh/themes/cwoebker.zsh-theme

install-vim:
	@echo "Linking vim setup..."
	@ln -fs `pwd`/vim ~/.vim
	@echo "Updating vim plugins..."
	@echo "-----------------------"
	@git submodule foreach git pull origin master --recurse-submodules
	@echo "-----------------------"

install-git:
	@echo "Installing git configs..."
	@ln -fs `pwd`/git/gitconfig ~/.gitconfig
	@ln -fs `pwd`/git/gitignore ~/.gitignore

install-virtualenvwrapper:
	@echo "Installing virtualenvwrapper custom hooks..."
	@mkdir -p ~/.virtualenvs/
	@ln -fs `pwd`/virtualenvwrapper/* ~/.virtualenvs/

install-python:
	@echo "Installing python configs..."
	@ln -fs `pwd`/python/pythonrc.py ~/.pythonrc.py

install-finish:
	@echo "--------------------------------------------"
	@echo "Installtion of cwoebker's dotfiles complete!"
