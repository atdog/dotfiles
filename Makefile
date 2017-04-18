.cshrc:
	ln -s ${HOME}/.rcfiles/cshrc ${HOME}/.cshrc

.bashrc:
	ln -s ${HOME}/.rcfiles/bashrc ${HOME}/.bashrc 
	
.muttrc:
	ln -s ${HOME}/.rcfiles/muttrc ${HOME}/.muttrc 

.screenrc:
	ln -s ${HOME}/.rcfiles/screenrc ${HOME}/.screenrc 

.tmux.conf:
	ln -s ${HOME}/.rcfiles/tmux.conf ${HOME}/.tmux.conf

.gitconfig:
	ln -s ${HOME}/.rcfiles/gitconfig ${HOME}/.gitconfig

.gdbinit:
	ln -s ${HOME}/.rcfiles/gdbinit ${HOME}/.gdbinit

.zshrc:
	wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
	rm ~/.zshrc
	ln -s ${HOME}/.rcfiles/zshrc ${HOME}/.zshrc

.vimrc:
	mkdir -p ${HOME}/.vim/bundle
	mkdir -p ${HOME}/.vim/temp
	mkdir -p ${HOME}/.vim/undo
	mkdir -p ${HOME}/.vim/session
	mkdir -p ${HOME}/.vim/backup
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
	ln -s ${HOME}/.rcfiles/vimrc ${HOME}/.vimrc
	ln -s ${HOME}/.rcfiles/vimcolors ${HOME}/.vim/colors
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
