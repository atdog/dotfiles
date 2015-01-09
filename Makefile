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

.vimrc:
	mkdir -p ${HOME}/.vim/bundle
	mkdir -p ${HOME}/.vim/temp
	mkdir -p ${HOME}/.vim/undo
	mkdir -p ${HOME}/.vim/session
	mkdir -p ${HOME}/.vim/backup
	git clone git://github.com/gmarik/vundle.git ${HOME}/.vim/bundle/vundle
	ln -s ${HOME}/.rcfiles/vimrc ${HOME}/.vimrc
	ln -s ${HOME}/.rcfiles/vimcolors ${HOME}/.vim/colors
	vim '+BundleInstall'

clean:
	rm -rf ${HOME}/.gitconfig
	rm -rf ${HOME}/.cshrc
	rm -rf ${HOME}/.bashrc
	rm -rf ${HOME}/.muttrc
	rm -rf ${HOME}/.screenrc
	rm -rf ${HOME}/.vim
	rm -rf ${HOME}/.vimrc

basic: clean .bashrc .gitconfig .vimrc
