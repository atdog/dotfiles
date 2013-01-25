.cshrc:
	ln -s ${HOME}/.rcfiles/cshrc ${HOME}/.cshrc

.bashrc:
	ln -s ${HOME}/.rcfiles/bashrc ${HOME}/.bashrc 
	
.muttrc:
	ln -s ${HOME}/.rcfiles/muttrc ${HOME}/.muttrc 

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
