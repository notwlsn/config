#!/usr/bin/env bash
# gwillson.camp@protonmail.ch

echo "Read this whole script before you run it. I use it for my own purposes, and I use it to install common software on APT compatible distros. Run at your own risk."

#priv check
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root"
	exit 1
fi

#tmux
echo "Installing tmux..."
sudo apt install tmux

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

#powerline-fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

#powerline
pip install powerline-status

#fzf support
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#This is starting to leave scope here. It's becoming less dotfile focused and more  or less an ansible playbook. And I'm alright with that, but I should probably warn other people or break it off into an environment setup script for new VMs.

#Xresources
echo "Creating Xresources configuration file..."
cp Xresources ~/.Xresources

#xbindkeys
echo "Installing xbindkeys..."
sudo apt install xbindkeys
echo "Creating xbindkeys configuration file..."
cp xbindkeysrc ~/.xbindkeysrc

#dmenu
echo "Installing dmenu..."
sudo apt install dmenu

#screen
echo "Installing screen..."
sudo apt install screen

echo "Done. To restore overwrite current configs with thier *_old counterparts in applicable locations."
echo "Restart or source ~/.bashrc to see changes."
