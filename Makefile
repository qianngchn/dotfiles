TOP_DIR=$(CURDIR)

.PHONY:install uninstall

install:
	file ~/.bash_aliases 2>&1 > /dev/null || ln -s $(TOP_DIR)/bash_aliases ~/.bash_aliases
	file ~/.vimrc 2>&1 > /dev/null || ln -s $(TOP_DIR)/vimrc ~/.vimrc
	file ~/.tmux.conf 2>&1 > /dev/null || ln -s $(TOP_DIR)/tmux.conf ~/.tmux.conf
	file ~/.gitconfig 2>&1 > /dev/null || ln -s $(TOP_DIR)/gitconfig ~/.gitconfig

uninstall:
	rm -rf ~/.bash_aliases
	rm -rf ~/.vimrc
	rm -rf ~/.tmux.conf
	rm -rf ~/.gitconfig
