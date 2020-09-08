#!/usr/bin/env bash
# WC 2020

#echo $SHELL

#tmux
if [ -f ~/.tmux.conf ];
	then	
		echo "tmux.conf exists, backing up to tmux_conf_old"
		cp ~/.tmux.conf tmux_conf_old 
	    	cp tmux.conf ~/.tmux.conf
fi
echo "no current tmux.conf in home dir, copying..."
echo "please note this only checks home, if your tmux.conf is somewhere else please install manually"
cp tmux.conf ~/.tmux.conf

#bash
echo "Backing up ~/.bashrc to bashrc_old..."
cp ~/.bashrc bashrc_old

echo "Copying new bashrc..."
cp bashrc ~/.bashrc

#Cannot source a bashrc from within a script due to segregated instances of shell.
#source ~/.bashrc

#vim
if [ -f ~/.vimrc ];
	then 
	    	echo "vimrc exists, backing it up to vimrc_old..."
	     	cp ~/.vimrc vimrc_old
	      	cp vimrc ~/.vimrc
fi
echo "no current vimrc, copying..."
cp vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ':PluginInstall' -c 'q' -c ':q'

echo "Done. To restore overwrite current configs with thier *_old counterparts in applicable locations."
echo "Restart or source ~/.bashrc to see changes."
