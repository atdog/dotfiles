tcshrc:
	ln -s ~/.rcfiles/cshrc ~/.cshrc

bashrc:
	ln -s ~/.rcfiles/bashrc ~/.bashrc 

muttrc:
	ln -s ~/.rcfiles/muttrc ~/.muttrc 

vimrc:
	mkdir -p ~/.vim/bundle
	mkdir -p ~/.vim/temp
	mkdir -p ~/.vim/undo
	mkdir -p ~/.vim/session
	mkdir -p ~/.vim/backup
	git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	ln -s ~/.rcfiles/vimrc ~/.vimrc 
    ln -s ~/.rcfiles/vimcolors ~/.vim/colors

all: tcshrc bashrc muttrc vimrc

