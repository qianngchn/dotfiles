TOP_DIR=$(CURDIR)

.PHONY:install uninstall

install:
	@if [ ! -f ~/.bash_aliases ]; then ln -s $(TOP_DIR)/bash_aliases ~/.bash_aliases; fi
	@if [ ! -f ~/.vimrc ]; then ln -s $(TOP_DIR)/vimrc ~/.vimrc; fi
	@if [ ! -f ~/.tmux.conf ]; then ln -s $(TOP_DIR)/tmux.conf ~/.tmux.conf; fi
	@if [ ! -f ~/.gitconfig ]; then ln -s $(TOP_DIR)/gitconfig ~/.gitconfig; fi

uninstall:
	rm -rf ~/.bash_aliases
	rm -rf ~/.vimrc
	rm -rf ~/.tmux.conf
	rm -rf ~/.gitconfig
