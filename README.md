### Run command files

##### Download Repository
	$ git clone git@github.com:atdog/rcfiles.git ~/.rcfiles
#### Bashrc
	$ ln -s ~/.rcfiles/bashrc ~/.bashrc 
#### vimrc
	$ mkdir -p ~/.vim/bundle
	$ mkdir -p ~/.vim/temp
	$ mkdir -p ~/.vim/undo
	$ mkdir -p ~/.vim/session
	$ git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	$ ln -s ~/.rcfiles/vimrc ~/.vimrc 
	
##### Then, in vim
	
	: BundleInstall
