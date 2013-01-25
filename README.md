### Run command files

##### Download Repository
	$ git clone git@github.com:atdog/rcfiles.git ~/.rcfiles
#### Tcshrc
	$ ln -s ~/.rcfiles/cshrc ~/.cshrc 
#### Bashrc
	$ ln -s ~/.rcfiles/bashrc ~/.bashrc 
#### Vimrc
	$ mkdir -p ~/.vim/bundle
	$ mkdir -p ~/.vim/temp
	$ mkdir -p ~/.vim/undo
	$ mkdir -p ~/.vim/session
	$ mkdir -p ~/.vim/backup
	$ git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	$ ln -s ~/.rcfiles/vimrc ~/.vimrc 
    $ ln -s ~/.rcfiles/vimcolors ~/.vim/colors
	
##### Then, in Vim
	
	: BundleInstall

#### Muttrc
    $ ln -s ~/.rcfiles/muttrc ~/.muttrc
