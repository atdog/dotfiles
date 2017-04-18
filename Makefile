.cshrc:
	ln -s ${HOME}/.dotfiles/cshrc ${HOME}/.cshrc

.bashrc:
	ln -s ${HOME}/.dotfiles/bashrc ${HOME}/.bashrc 
	
.muttrc:
	ln -s ${HOME}/.dotfiles/muttrc ${HOME}/.muttrc 

.screenrc:
	ln -s ${HOME}/.dotfiles/screenrc ${HOME}/.screenrc 

.tmux.conf:
	ln -s ${HOME}/.dotfiles/tmux.conf ${HOME}/.tmux.conf

.gitconfig:
	ln -s ${HOME}/.dotfiles/gitconfig ${HOME}/.gitconfig

.gdbinit:
	ln -s ${HOME}/.dotfiles/gdbinit ${HOME}/.gdbinit

.zshrc:
	wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
	rm ~/.zshrc
	ln -s ${HOME}/.dotfiles/zshrc ${HOME}/.zshrc

.vimrc:
	mkdir -p ${HOME}/.vim/temp
	mkdir -p ${HOME}/.vim/undo
	mkdir -p ${HOME}/.vim/session
	mkdir -p ${HOME}/.vim/backup
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -s ${HOME}/.dotfiles/vimrc ${HOME}/.vimrc
	ln -s ${HOME}/.dotfiles/vimcolors ${HOME}/.vim/colors
	vim +PlugInstall +qall

clean:
	rm -rf ${HOME}/.gitconfig
	rm -rf ${HOME}/.cshrc
	rm -rf ${HOME}/.bashrc
	rm -rf ${HOME}/.muttrc
	rm -rf ${HOME}/.screenrc
	rm -rf ${HOME}/.vim
	rm -rf ${HOME}/.vimrc
	rm -rf ${HOME}/.tmux.conf
	rm -rf ${HOME}/.gdbinit

basic: clean .zshrc .gitconfig .vimrc .tmux.conf .gdbinit
