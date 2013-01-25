### Run command files

##### Download Repository
	$ git clone git@github.com:atdog/rcfiles.git ~/.rcfiles
#### Tcshrc
	$ ln -s ~/.rcfiles/cshrc ~/.cshrc 
#### Bashrc
	$ ln -s ~/.rcfiles/bashrc ~/.bashrc 
#### Vimrc
	$ mkdir -p ~/.vim/bundle
	$ git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	$ ln -s ~/.rcfiles/vimrc ~/.vimrc 
	
##### Then, in Vim
	
	: BundleInstall
