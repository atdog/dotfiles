### Run command files

##### Download Repository
	$ git clone git@github.com:atdog/rcfiles.git ${HOME}/.rcfiles
	
#### git config
	$ ln -s ${HOME}/.rcfiles/gitconfig ${HOME}/.gitconfig 

#### cshrc
	$ ln -s ${HOME}/.rcfiles/cshrc ${HOME}/.cshrc 
	
#### Bashrc
	$ ln -s ${HOME}/.rcfiles/bashrc ${HOME}/.bashrc 
#### Vimrc
	$ mkdir -p ${HOME}/.vim/bundle
	$ mkdir -p ${HOME}/.vim/temp
	$ mkdir -p ${HOME}/.vim/undo
	$ mkdir -p ${HOME}/.vim/session
	$ mkdir -p ${HOME}/.vim/backup
	$ git clone git://github.com/gmarik/vundle.git ${HOME}/.vim/bundle/vundle
	$ ln -s ${HOME}/.rcfiles/vimrc ${HOME}/.vimrc 
    $ ln -s ${HOME}/.rcfiles/vimcolors ${HOME}/.vim/colors
	
##### Then, in Vim
	
	: BundleInstall

#### Muttrc
    $ ln -s ${HOME}/.rcfiles/muttrc ${HOME}/.muttrc

#### Screenrc
    $ ln -s ${HOME}/.rcfiles/screenrc ${HOME}/.screenrc
